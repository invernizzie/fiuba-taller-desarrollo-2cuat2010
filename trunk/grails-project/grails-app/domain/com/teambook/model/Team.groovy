package com.teambook.model

class Team {

    String name
    List<User> players
    Discipline discipline

    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        players(minSize: 1)
    }
}
