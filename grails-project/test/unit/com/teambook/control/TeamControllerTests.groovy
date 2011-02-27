package com.teambook.control

import grails.test.*

class TeamControllerTests extends ControllerUnitTestCase {

    def teamController

    protected void setUp() {
        super.setUp()
        teamController = new TeamController()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testUnescape() {
        assert "a" == teamController.unescape("\\a")
        assert "\\" == teamController.unescape("\\\\")
        assert "\"" == teamController.unescape("\\\"")
    }
}
