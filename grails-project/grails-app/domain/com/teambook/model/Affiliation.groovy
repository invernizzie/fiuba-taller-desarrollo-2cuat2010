package com.teambook.model

class Affiliation implements Comparable {

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


    int compareTo(Object t) {
        if (!(t instanceof Affiliation))
            return 0
        Affiliation that = (Affiliation) t
        return this.player.getRatingForDiscipline(team.discipline) >=
                that.player.getRatingForDiscipline(team.discipline) ? 1 : -1
    }
}
