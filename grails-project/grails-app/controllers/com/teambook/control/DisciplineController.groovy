package com.teambook.control

import com.teambook.model.Discipline

class DisciplineController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [disciplineInstanceList: Discipline.list(params), disciplineInstanceTotal: Discipline.count()]
    }

    def create = {
        def disciplineInstance = new Discipline()
        disciplineInstance.playersPerTeam=1 // one player by default
        disciplineInstance.properties = params
    
        return [disciplineInstance: disciplineInstance]
    }

    def save = {
	   
        def disciplineInstance = new Discipline(params)
     
        if (disciplineInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'discipline.label', default: 'Discipline'), disciplineInstance.id])}"
            redirect(action: "show", id: disciplineInstance.id)
        }
        else {
            render(view: "create", model: [disciplineInstance: disciplineInstance])
        }
    }

    def show = {
        def disciplineInstance = Discipline.get(params.id)
        if (!disciplineInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
            redirect(action: "list")
        }
        else {
            [disciplineInstance: disciplineInstance]
        }
    }

    def edit = {
        def disciplineInstance = Discipline.get(params.id)
        if (!disciplineInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [disciplineInstance: disciplineInstance]
        }
    }

    def update = {
        def disciplineInstance = Discipline.get(params.id)
        if (disciplineInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (disciplineInstance.version > version) {
                    
                    disciplineInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'discipline.label', default: 'Discipline')] as Object[], "Another user has updated this Discipline while you were editing")
                    render(view: "edit", model: [disciplineInstance: disciplineInstance])
                    return
                }
            }
            disciplineInstance.properties = params
            if (!disciplineInstance.hasErrors() && disciplineInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'discipline.label', default: 'Discipline'), disciplineInstance.id])}"
                redirect(action: "show", id: disciplineInstance.id)
            }
            else {
                render(view: "edit", model: [disciplineInstance: disciplineInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def disciplineInstance = Discipline.get(params.id)
        if (disciplineInstance) {
            try {
                disciplineInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'discipline.label', default: 'Discipline'), params.id])}"
            redirect(action: "list")
        }
    }
}
