package com.teambook.model

class User {

    private static final int MINIMUM_AGE = 18

    String username
    String firstName
    String lastName
    Date birthday
    String email

    String toString() {
        "$firstName $lastName"
    }

    static constraints = {
        username(blank: false)
        firstName(blank: false)
        lastName(blank: false)
        birthday(min: Calendar.getInstance().add(Calendar.YEAR, -MINIMUM_AGE))
        email(blank: false, email: true)
    }
}