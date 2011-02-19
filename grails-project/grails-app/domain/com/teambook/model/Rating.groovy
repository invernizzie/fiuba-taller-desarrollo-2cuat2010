package com.teambook.model

class Rating {
	
	// The user rates a Player for his skill in a specific discipline
	static belongsTo = [player:Player, discipline:Discipline, user:User]
	
	int rating

    static constraints = {
    	rating(min:0, max:10)
    }
}
