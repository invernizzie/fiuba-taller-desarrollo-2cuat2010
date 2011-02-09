package com.teambook.model

class Team {

    String name
    List<User> players
    Discipline discipline

    static constraints = {
        name(blank: false)
        players(minSize: 1)
    }
}
