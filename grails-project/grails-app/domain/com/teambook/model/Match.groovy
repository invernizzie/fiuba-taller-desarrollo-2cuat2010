package com.teambook.model

import com.teambook.model.exceptions.SameLocalAndAwayTeamException

class Match {

    String name
    Date startingTime
    Date endingTime
    boolean publicMatch

    Outcome outcome
    String score

    User owner

    Team localTeam
    Team awayTeam

    PlayingField field

    Discipline discipline

    boolean isAlreadyPlayed() {
        !endingTime.after(new Date())
    }

    boolean isScoreToBeRegistered() {
        alreadyPlayed && !outcome
    }

    Team getWinner() {
        switch (outcome) {
            case Outcome.LOCAL_WON:
                return localTeam
            case Outcome.AWAY_WON:
                return awayTeam
            default:
                return null
        }
    }

    static constraints = {
        name(blank: false)
        outcome(nullable: true)
        score(nullable: true, blank: false)
    }

    static transients = ['alreadyPlayed', 'scoreToBeRegistered', 'winner']

    // Can't use validate(), it's dynamically bound by Grails
    def checkValidity() {
        if (localTeam == awayTeam) {
            throw new SameLocalAndAwayTeamException()
        }
    }
}
