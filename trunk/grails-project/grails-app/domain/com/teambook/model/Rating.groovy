package com.teambook.model

class Rating {
	
	// The user rates a Player for his skill in a specific discipline
	static belongsTo = [player:Player, discipline:Discipline, user:User]

    Player player
    Discipline discipline
    User user
	int rating

    static constraints = {
    	rating(min:0, max:10)
        user( validator: { value, instance ->
            def othersFromThisUserToThisPlayer = Rating.createCriteria().list {
                player { eq("id", instance.player.id) }
                user { eq("id", value.id) }
                discipline { eq("id", instance.discipline.id) }
            }
            return othersFromThisUserToThisPlayer.size() < 1
        })
    }
}
