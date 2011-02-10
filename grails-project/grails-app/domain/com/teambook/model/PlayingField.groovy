package com.teambook.model

class PlayingField {

    String name
    String address
    String city
    String state
    String country
    List<Discipline> availableDisciplines

    String toString() {
        name
    }

    static constraints = {
        name(blank: false)
        address(blank: false)
        city(nullable: true)
        state(nullable: true)
        country(nullable: true)
    }
}
