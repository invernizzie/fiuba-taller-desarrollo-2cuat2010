package com.teambook.control

class UserController {

    def userService

    def index = {
        redirect(action: 'fbLogin')
    }

    def fbLogin = {
        if (!session.user) {
            if (session.facebook.uid) {
                session.user = userService.findOrCreateByFbUid(session.facebook.uid)
            } else {
                return params
            }
        }
        if (!params.callbackController && !params.callbackAction)
            return redirect(uri: '/')
        redirect(controller: params.callbackController, action: params.callbackAction)
    }

    def logout = {
        session.invalidate()
        redirect(uri: '')
    }
}
