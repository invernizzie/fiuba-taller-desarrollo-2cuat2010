package com.teambook.control

import com.teambook.model.PlayingField

class PlayingFieldController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [playingFieldInstanceList: PlayingField.list(params), playingFieldInstanceTotal: PlayingField.count()]
    }

    def create = {
        def playingFieldInstance = new PlayingField()
        playingFieldInstance.properties = params
        return [playingFieldInstance: playingFieldInstance]
    }

    def save = {
        def playingFieldInstance = new PlayingField(params)
        if (playingFieldInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'playingField.label', default: 'PlayingField'), playingFieldInstance.id])}"
            redirect(action: "show", id: playingFieldInstance.id)
        }
        else {
            render(view: "create", model: [playingFieldInstance: playingFieldInstance])
        }
    }

    def show = {
        def playingFieldInstance = PlayingField.get(params.id)
        if (!playingFieldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
            redirect(action: "list")
        }
        else {
            [playingFieldInstance: playingFieldInstance]
        }
    }

    def edit = {
        def playingFieldInstance = PlayingField.get(params.id)
        if (!playingFieldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [playingFieldInstance: playingFieldInstance]
        }
    }

    def update = {
        def playingFieldInstance = PlayingField.get(params.id)
        if (playingFieldInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (playingFieldInstance.version > version) {
                    
                    playingFieldInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'playingField.label', default: 'PlayingField')] as Object[], "Another user has updated this PlayingField while you were editing")
                    render(view: "edit", model: [playingFieldInstance: playingFieldInstance])
                    return
                }
            }
            playingFieldInstance.properties = params
            if (!playingFieldInstance.hasErrors() && playingFieldInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'playingField.label', default: 'PlayingField'), playingFieldInstance.id])}"
                redirect(action: "show", id: playingFieldInstance.id)
            }
            else {
                render(view: "edit", model: [playingFieldInstance: playingFieldInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def playingFieldInstance = PlayingField.get(params.id)
        if (playingFieldInstance) {
            try {
                playingFieldInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'playingField.label', default: 'PlayingField'), params.id])}"
            redirect(action: "list")
        }
    }

}
