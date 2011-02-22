package com.teambook.model

class Team {

    String name
	
	static hasMany = [affiliations: Affiliation]
    
    Discipline discipline

    boolean isComplete() {
        // Should never be greater anyway
        affiliations.size() >= discipline.playersPerTeam
    }

    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        // TODO Validate max players allowed by its discipline
        affiliations(minSize: 1, nullable: false)
    }

    static transients = ['complete', 'hasPlayer']

    boolean hasPlayer(Player player) {
        def found = affiliations.find {
            it.player.id == player.id
        }
        return found
    }
}
