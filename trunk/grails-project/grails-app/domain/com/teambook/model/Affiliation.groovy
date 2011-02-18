package com.teambook.model

class Affiliation {

	Date dateCreated

	int gamesPlayed

	static belongsTo = [player:Player, team:Team]

	String toString() {
        player.user.name+" at "+team.name
    }

    static constraints = {
	    team()
		player()
		dateCreated()
		gamesPlayed(min: 0)
    }
    
   
}
