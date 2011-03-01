package com.teambook.control

import com.teambook.model.exceptions.SameLocalAndAwayTeamException
import com.teambook.model.*

class MatchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def facebookGraphService
    def ratingService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        def criteria = Match.createCriteria()
        def foundMatches = criteria.list {
            // Esta sintaxis no es lo mas legible pero es corta
            params.matchName ? ilike("name", "%${params.matchName}%") :null
            if (params.disciplineId && (params.disciplineId != 'null'))
                discipline {  // TODO Tiene que existir una mejor manera de hacer esto
                    eq("id", Long.parseLong(params.disciplineId))
                }
            params.localTeam ?
            localTeam {
                ilike("name", "%${params.localTeam}%")
            } :null
            params.awayTeam ?
            awayTeam {
                ilike("name", "%${params.awayTeam}%")
            } :null
            params.minDate ? ge("startingTime", params.minDate) : null
            params.maxDate ? le("endingTime", params.maxDate) : null
            params.matchOwner ?
            owner {
                ilike("name", "%${params.matchOwner}%")
            } :null
            maxResults(Math.min(params.max ? params.int('max') : 10, 100))
        }
        params.putAll ([matchInstanceList: foundMatches, matchInstanceTotal: foundMatches.size()])
        params
    }

    def create = {
        def matchInstance = new Match()
        matchInstance.publicMatch = true // Create public matches by default
        matchInstance.properties = params
        return [matchInstance: matchInstance]
    }

    def save = {
        def match = new Match(params)
        match.owner = session.user
        try {
            match.checkValidity()
        } catch (SameLocalAndAwayTeamException e) {
            flash.message = "${message(code: 'match.error.sameLocalAndAway')}"
            return render(view: "create", model: [matchInstance: match])
        }
        if (match.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'match.label', default: 'Match'), match.id])}"
            redirect(action: "show", id: match.id)
        }
        else {
            render(view: "create", model: [matchInstance: match])
        }
    }

    def show = {
        def matchInstance = Match.get(params.id)
        if (!matchInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
            redirect(action: "list")
        }
        else {
            [matchInstance: matchInstance]
        }
    }

    def registerOutcome = {
        def matchInstance = Match.get(params.id)
        if (!matchInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
            return redirect(action: "show", params: params)
        }
        if (matchInstance.owner.id != session.user.id) {
            flash.message = "${message(code: 'match.error.notYourMatch')}"
            return redirect(action: "show", params: params)
        }
        if (matchInstance.endingTime.after(new Date())) {
            flash.message = "${message(code: 'match.error.notPlayed')}"
            return redirect(action: "show", params: params)
        }
        def outcome = Outcome.valueOf(params.outcome)
        if (!outcome) {
            flash.message = "${message(code: 'match.error.invalidOutcome')}"
            return redirect(action: "show", params: params)
        }
        matchInstance.outcome = outcome
        matchInstance.score = params.score
        if (matchInstance.save(flush: true)) {
            redirect(action: "show", params: params)
        } else {
            redirect(action: "show", params: params)
        }
    }

    def teamListJoin = {
        def affiliationInstance = new Affiliation(params)
        // TODO Pasar a un validator
        if (affiliationInstance.team.hasPlayer(session.user.player)) {
            return render(status: 500, text: message(code: 'affiliation.error.alreadyAffiliated'))
        }
		affiliationInstance.player = session.user.player
		affiliationInstance.gamesPlayed = 0

        affiliationInstance.team.addToAffiliations(affiliationInstance)

        if (affiliationInstance.save(flush: true) && affiliationInstance.team.save(flush: true)) {
            def match = params.match.id ? Match.load(params.match.id) : null
            render(template: 'teamList', model: [team: affiliationInstance.team, match: match])
        }
        else {
            render(status: 500, text: message(code: 'errors.internal'))
        }
    }

    def ratePlayer = {
        // FIXME Desde aca hasta player.save(), esto debe ir en un service
        // TODO Validaciones
        def player = Player.load(params.player.id)
        def discipline = Discipline.load(params.discipline.id)
        def newRating = ratingService.addOrUpdate(player, session.user, discipline, Long.valueOf(params.rating))
        if (!newRating) {
            return render(status: 500, text: message(code: 'errors.internal'))
        }
        player.addToRatings(newRating)
        player.save()
        // TODO Esto es super ad-hoc para usar este action en la lista de jugadores de un equipo
        render(controller: 'match', template: 'teamList', model: [team: Team.load(params.team.id), match: Match.load(params.match.id)])
    }

    def edit = {
        def matchInstance = Match.get(params.id)
        if (!matchInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [matchInstance: matchInstance]
        }
    }

    def update = {
        def matchInstance = Match.get(params.id)
        if (matchInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (matchInstance.version > version) {
                    
                    matchInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'match.label', default: 'Match')] as Object[], "Another user has updated this Match while you were editing")
                    render(view: "edit", model: [matchInstance: matchInstance])
                    return
                }
            }
            matchInstance.properties = params
            try {
                matchInstance.checkValidity()
            } catch (SameLocalAndAwayTeamException e) {
                flash.message = "${message(code: 'match.error.sameLocalAndAway')}"
                return render(view: "create", model: [matchInstance: match])
            }
            if (!matchInstance.hasErrors() && matchInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'match.label', default: 'Match'), matchInstance.id])}"
                redirect(action: "show", id: matchInstance.id)
            }
            else {
                render(view: "edit", model: [matchInstance: matchInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def matchInstance = Match.get(params.id)
        if (matchInstance) {
            try {
                matchInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])}"
            redirect(action: "list")
        }
    }

    def chooseFriends = {
        [match: params.matchId ? Match.load(params.matchId) : null, team: Team.load(params.teamId)]
    }

    def filterFriends = {
        if (params.query != null) {
            log.info "Starting friend filtering"
            def init =  new Date().getTime()
            if (!/*flash*/session.friends) {
                log.info "Friends list not in flash, loading from facebook"
                // TODO Merge friends with teambook users
                /*flash*/session.friends = facebookGraphService.friends.data
                log.info "Finished loading friends from facebook in ${new Date().getTime() - init} ms"
            }
            //flash.friends = flash.friends
            def filteredFriends = /*flash*/session.friends.findAll { friend ->
                friend.name.toLowerCase()
                        .contains(params.query.toLowerCase())
            }
            log.info "Finished filtering friends in ${new Date().getTime() - init} ms"
            return render(view: 'friendSelection', model: [friends: filteredFriends])
        }
    }

}
