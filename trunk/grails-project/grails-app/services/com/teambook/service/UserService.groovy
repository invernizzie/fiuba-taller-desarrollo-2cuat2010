package com.teambook.service

import com.daureos.facebook.FacebookGraphException
import com.teambook.exceptions.NoFacebookSessionException
import com.teambook.model.Player
import com.teambook.model.User
import grails.converters.JSON

class UserService {

    def facebookGraphService

    static transactional = true

    def findOrCreateByFbUid(String facebookUid) {
        User user = User.findByFacebookUid(facebookUid)
        if (!user) {
            def fbProfile = facebookGraphService.api(facebookUid, facebookGraphService.facebookData)
            //def fbProfile = facebookGraphService.getFacebookProfile()
            if (!fbProfile)
                throw new NoFacebookSessionException()
            user = new User( [
                    facebookUid: facebookUid,
                    username: 'username', // No tiene importancia, se loggea con fb
                    name: fbProfile.name[0..<Math.min(30, fbProfile.name.length())],
                    birthday: fbProfile.birthday,
                    email: fbProfile.email ?: 'none@none.com',
                    player: new Player()
            ])
            user.save(flush: true)
        }
        user
    }

    def findOrCreateByFbUidWithoutSession(String facebookUid) {
        User user = User.findByFacebookUid(facebookUid)
        if (!user) {
            def fbProfile = getPublicProfile(facebookUid)
            user = new User( [
                    facebookUid: facebookUid,
                    username: 'username', // No tiene importancia, se loggea con fb
                    name: fbProfile.name[0..<Math.min(30, fbProfile.name.length())],
                    birthday: fbProfile.birthday,
                    email: fbProfile.email ?: 'none@none.com',
                    player: new Player()
            ])
            user.save(flush: true)
        }
        user
    }

    def getPublicProfile(facebookUid) {
        def url = facebookGraphService.getUrl('graph', facebookUid)
        def result = facebookGraphService.makeRequest(url, [method: 'GET'])
        if(!result) throw new FacebookGraphException()
        result = JSON.parse(result)
    }
}
