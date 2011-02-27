package com.teambook.control

import com.teambook.model.Team
import com.teambook.model.Match
import com.teambook.model.Affiliation
import grails.converters.deep.JSON

class TeamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def userService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teamInstanceList: Team.list(params), teamInstanceTotal: Team.count()]
    }

    def create = {
        def teamInstance = new Team()
        teamInstance.properties = params
        return [teamInstance: teamInstance]
    }

    def save = {
        def teamInstance = new Team(params)
        if (teamInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])}"
            redirect(action: "show", id: teamInstance.id)
        }
        else {
            render(view: "create", model: [teamInstance: teamInstance])
        }
    }

    def show = {
        def teamInstance = Team.get(params.id)
        if (!teamInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
        else {
            [teamInstance: teamInstance]
        }
    }

    def edit = {
        def teamInstance = Team.get(params.id)
        if (!teamInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [teamInstance: teamInstance]
        }
    }

    def update = {
        def teamInstance = Team.get(params.id)
        if (teamInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (teamInstance.version > version) {
                    
                    teamInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'team.label', default: 'Team')] as Object[], "Another user has updated this Team while you were editing")
                    render(view: "edit", model: [teamInstance: teamInstance])
                    return
                }
            }
            teamInstance.properties = params
            if (!teamInstance.hasErrors() && teamInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])}"
                redirect(action: "show", id: teamInstance.id)
            }
            else {
                render(view: "edit", model: [teamInstance: teamInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def teamInstance = Team.get(params.id)
        if (teamInstance) {
            try {
                teamInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
    }

    def addPlayers = {
        def team = Team.load(params.teamId)
        def selectedFriends = params.selectedFriends ? JSON.parse(unescape(params.selectedFriends)) : null
        selectedFriends?.each {
            team?.addToAffiliations(new Affiliation(
                    dateCreated: new Date(),
                    gamesPlayed: 0,
                    team: team,
                    player: userService.findOrCreateByFbUid(it.id).player
            ))
        }
        team?.save()
        if (params.matchId) {
            return redirect(controller: 'match', action: 'show', id: params.matchId)
        }
        return redirect(controller: 'team', action: 'show', id: params.teamId)
    }

    String unescape(String str) {
        str = str.substring(1, str.length() - 1)
        str.replaceAll("\\\\(.)") { x, y ->
            y
        }
    }
}
