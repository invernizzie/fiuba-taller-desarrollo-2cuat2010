package com.teambook.service

import com.teambook.model.Match

class MatchService {

    static transactional = true

    def findIncomingMatches(maxResults) {
        def now = new Date();
        Match.findByStartingTimeGreaterThanEquals(now, [max: maxResults, sort: "startingTime", order: "asc"])
    }
}
