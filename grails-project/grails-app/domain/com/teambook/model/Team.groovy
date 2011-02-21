package com.teambook.model

class Team {

    String name
	
	static hasMany = [affiliations: Affiliation]
    
    Discipline discipline

    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        affiliations(minSize: 1, nullable: false)
    }
}
