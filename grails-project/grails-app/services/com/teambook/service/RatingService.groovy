package com.teambook.service

import com.teambook.model.Discipline
import com.teambook.model.Player
import com.teambook.model.Rating
import com.teambook.model.User

class RatingService {

    static transactional = true

    Rating addOrUpdate(Player ratedPlayer, User ratingUser, Discipline disciplineChosen, Number rating) {
        Rating existingRating = Rating.createCriteria().get {
            player { eq("id", ratedPlayer.id) }
            user { eq("id", ratingUser.id) }
            discipline { eq("id", disciplineChosen.id) }
        }
        if (!existingRating) {
            existingRating = new Rating(player: ratedPlayer, discipline: disciplineChosen, user: ratingUser, rating: rating)
        }
        existingRating.rating = rating
        existingRating.save(flush: true)
        return existingRating
    }
}
