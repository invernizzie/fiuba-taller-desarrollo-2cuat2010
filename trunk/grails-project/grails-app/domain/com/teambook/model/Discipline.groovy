package com.teambook.model

class Discipline {

    String name

    // How many players a team of this discipline must have
    int playersPerTeam

    static constraints = {
        name(blank: false)
        playersPerTeam(min: 1)
    }
}
