package com.teambook

class SecurityFilters {

    def filters = {

        allButHome(controller: 'home|user', invert: true) {
            before = {
                if (!controllerName && !actionName) // FIXME Por ahora identifico asi la home, luego habra un controller
                    return true
                if (!session?.user) {
                    // Hay codigo duplicado porque este closure del orto no funciona, necesito aprender mas groovy
                    //loginRedirect(controllerName, actionName)
                    redirect(
                            controller: 'user',
                            action: 'fbLogin',
                            params: [callbackController: controllerName ?: '',
                                    callbackAction: actionName ?: '' ])
                    return false
                }
                return true
            }
        }

        userLogin(controller: 'user', action: 'fbLogin', invert: true) {
            before = {
                if (!controllerName && !actionName) // FIXME Por ahora identifico asi la home, luego habra un controller
                    return true
                if (!session?.user) {
                    redirect(
                            controller: 'user',
                            action: 'fbLogin',
                            params: [callbackController: controllerName ?: '',
                                    callbackAction: actionName ?: '' ])
                    return false
                }
                return true
            }
        }
    }

    def loginRedirect = { controller, action ->
        redirect(
                controller: 'user',
                action: 'fbLogin',
                params: [callbackController: controller ?: '',
                        callbackAction: action ?: '' ])
    }
    
}
