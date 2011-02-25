package com.teambook.view

class FacebookHelperTagLib {

    static namespace = "f"

    def facebookGraphService

    /**
     * @attr id The id of the user whose pic will be output
     */
    def pic = { attrs, body ->
        def id = "me"
        if (attrs.id) {
            id = attrs.id
        }
        out << """<img src="${facebookGraphService.getProfilePhotoSrc(id)}" />""";
    }
}
