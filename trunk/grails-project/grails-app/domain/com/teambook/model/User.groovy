package com.teambook.model

class User {

    private static final int MINIMUM_AGE = 18

    String username
    String name
    Date birthday
    String email

    String toString() {
        "$name"
    }

    static constraints = {
        username(blank: false)
        name(blank: false)
        birthday(min: Calendar.getInstance().add(Calendar.YEAR, -MINIMUM_AGE))
        email(blank: false, email: true)
    }
}