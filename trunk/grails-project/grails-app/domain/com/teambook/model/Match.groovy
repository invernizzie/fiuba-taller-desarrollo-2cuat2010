package com.teambook.model

import com.teambook.model.exceptions.SameLocalAndAwayTeamException

class Match {

    String name
    Date startingTime
    Date endingTime
    boolean publicMatch

    User owner

    Team localTeam
    Team awayTeam

    PlayingField field

    Discipline discipline

    static constraints = {
        name(blank: false)
    }

    // Can't use validate(), it's dynamically bound by Grails
    def checkValidity() {
        if (localTeam == awayTeam) {
            throw new SameLocalAndAwayTeamException()
        }
    }
}
