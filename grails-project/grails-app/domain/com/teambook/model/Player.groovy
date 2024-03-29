package com.teambook.model

class Player {

	static belongsTo = [user:User]

	int goals
	
	static hasMany = [affiliations:Affiliation,ratings:Rating]
	
	String toString() {
        user.name
    }
	
    static constraints = {
    
    }
    
    static transients = ['ratingsByDiscipline', 'ratingForDiscipline']
		    
    
    def getRatingsByDiscipline = {
    	   	
    	Map ratingByDisciplineSum = new HashMap()
    	Map ratingByDisciplineCount = new HashMap()
	
	
	    for ( element in ratings ) {	    	
    		ratingByDisciplineSum.putAt(element.discipline.toString(),ratingByDisciplineSum.get(element.discipline.toString(),0)+element.rating)
    		ratingByDisciplineCount.putAt(element.discipline.toString(),ratingByDisciplineCount.get(element.discipline.toString(),0)+1)
		}

 		
 		for ( element in ratingByDisciplineSum ) {
    		element.value=new Double(element.value/ratingByDisciplineCount.get(element.key)).round(2)
		}
 	
 		
    	ratingByDisciplineSum
    }

    def getRatingForDiscipline(Discipline discipline) {
        def sum = 0
        def count = 0

        ratings.each { rating ->
            if (rating.discipline.id == discipline.id) {
                sum += rating.rating
                count++
            }
        }
        return (count != 0) ? new Double(sum / count).round(2) : 0
    }
}
