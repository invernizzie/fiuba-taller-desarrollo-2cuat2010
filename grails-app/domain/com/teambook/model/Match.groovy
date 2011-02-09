package com.teambook.model

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
}
