package com.teambook.service

import com.teambook.exceptions.NoFacebookSessionException
import com.teambook.model.Player
import com.teambook.model.User

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
                    username: 'username',
                    name: fbProfile.name,
                    birthday: fbProfile.birthday,
                    email: fbProfile.email ?: 'none@none.com',
                    player: new Player()
            ])
            user.save(flush: true)
        }
        user
    }
}
