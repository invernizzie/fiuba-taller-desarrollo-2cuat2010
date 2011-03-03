package com.teambook.model

class Team {

    String name

    Discipline discipline

    SortedSet affiliations
    
    static hasMany = [affiliations: Affiliation]

    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        // TODO Validate max players allowed by its discipline
        affiliations(minSize: 1, nullable: false)
    }

    static transients = ['complete', 'hasPlayer', 'playersNeeded']

    boolean isComplete() {
        // Should never be greater anyway
        affiliations.size() >= discipline.playersPerTeam
    }

    boolean hasPlayer(Player player) {
        def found = affiliations.find {
            it.player.id == player.id
        }
        return found
    }

    def getPlayersNeeded() {
        discipline.playersPerTeam - affiliations.size()
    }
}
