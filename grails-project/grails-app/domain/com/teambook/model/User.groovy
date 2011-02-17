package com.teambook.model

class User {

    private static final int MINIMUM_AGE = 18

    String facebookUid

    String username // FIXME Probablemente no aplica
    String name
    Date birthday
    String email

    String toString() {
        "$name"
    }

    static constraints = {
        facebookUid(blank: false, unique: true)
        username(blank: false)
        name(blank: false)
        //birthday(min: Calendar.getInstance().add(Calendar.YEAR, -MINIMUM_AGE))
        /* No siempre lo aporta facebook, podria conseguirse
           si el usuario lo permite pero es al pedo */
        birthday(nullable: true)
        email(blank: false, email: true)
    }
}