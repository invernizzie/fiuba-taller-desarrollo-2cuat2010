package com.teambook.model

import com.teambook.model.exceptions.SameLocalAndAwayTeamException

class Match {

    Date startingTime
    Date endingTime
    boolean publicMatch

    User owner

    Team localTeam
    Team awayTeam

    PlayingField field

    Discipline discipline

    static constraints = {

    }

    // Can't use validate(), it's dynamically bound by Grails
    def checkValidity() {
        if (localTeam == awayTeam) {
            throw new SameLocalAndAwayTeamException()
        }
    }
}
