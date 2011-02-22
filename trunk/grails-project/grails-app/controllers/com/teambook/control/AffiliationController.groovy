package com.teambook.control

import com.teambook.model.Affiliation

class AffiliationController {

    static allowedMethods = [update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [affiliationInstanceList: Affiliation.list(params), affiliationInstanceTotal: Affiliation.count()]
    }

    def create = {
        def affiliationInstance = new Affiliation()
        affiliationInstance.properties = params
        return [affiliationInstance: affiliationInstance]
    }

    def save = {
        def affiliationInstance = new Affiliation(params)
        // TODO Pasar a un validator
        if (affiliationInstance.team.hasPlayer(session.user.player)) {
            flash.message = "${message(code: 'affiliation.error.alreadyAffiliated')}"
            //redirect(action: "create", params: [affiliationInstance: affiliationInstance])
            return render(view: "create", model: [affiliationInstance: affiliationInstance])
        }
		affiliationInstance.player = session.user.player
		affiliationInstance.gamesPlayed = 0
	    
        if (affiliationInstance.save(flush: true)) {
            flash.message = "${message(code: 'affiliation.created.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), affiliationInstance.id])}"
            redirect(action: "show", id: affiliationInstance.id)
        }
        else {
            render(view: "create", model: [affiliationInstance: affiliationInstance])
        }
    }

    def show = {
        def affiliationInstance = Affiliation.get(params.id)
        if (!affiliationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [affiliationInstance: affiliationInstance]
        }
    }

    def edit = {
        def affiliationInstance = Affiliation.get(params.id)
        if (!affiliationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [affiliationInstance: affiliationInstance]
        }
    }

    def update = {
        def affiliationInstance = Affiliation.get(params.id)
        if (affiliationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (affiliationInstance.version > version) {
                    
                    affiliationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'affiliation.label', default: 'Affiliation')] as Object[], "Another user has updated this Affiliation while you were editing")
                    render(view: "edit", model: [affiliationInstance: affiliationInstance])
                    return
                }
            }
            affiliationInstance.properties = params
            if (!affiliationInstance.hasErrors() && affiliationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), affiliationInstance.id])}"
                redirect(action: "show", id: affiliationInstance.id)
            }
            else {
                render(view: "edit", model: [affiliationInstance: affiliationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def affiliationInstance = Affiliation.get(params.id)
        if (affiliationInstance) {
            try {
                affiliationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'affiliation.label', default: 'Affiliation'), params.id])}"
            redirect(action: "list")
        }
    }
}
