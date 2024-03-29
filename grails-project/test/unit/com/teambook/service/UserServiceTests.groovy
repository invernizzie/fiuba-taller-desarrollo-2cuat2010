package com.teambook.service

import grails.test.GrailsUnitTestCase

class UserServiceTests extends GrailsUnitTestCase {

    UserService userService

    protected void setUp() {
        super.setUp()
        userService = new UserService()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGetFbPublicProfile() {
        def estebanProfile = userService.getPublicProfile('1040831504')
        assert estebanProfile.id == "1040831504"
        assert estebanProfile.name == "Esteban Invernizzi"
        assert estebanProfile.first_name == "Esteban"
        assert estebanProfile.last_name == "Invernizzi"
        assert estebanProfile.gender == "Male"
    }
}
