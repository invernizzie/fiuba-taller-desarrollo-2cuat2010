package com.teambook.model

class PlayingField {

    String name
    String address
    String city
    String state
    String country
    String telephoneNumber
    String website
    List<Discipline> availableDisciplines


	String photoPath
	
    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        address(blank: false)

        city(nullable: true)
        state(nullable: true)
        country(nullable: true)
		photoPath(nullable: true)
        telephoneNumber(nullable: true)
        website(nullable: true)
    }
}
