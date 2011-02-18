package com.teambook.model

class Player {

	static belongsTo = [user:User]

	int goals
	
	static hasMany = [affiliations:Affiliation]
	
	String toString() {
        user.name
    }
	
    static constraints = {
    
    }
}
