package com.teambook.control

import com.teambook.model.Player
import com.teambook.model.Discipline

class RankingController {

    def index = { }

    def show = {
        def discipline = Discipline.load(params.discipline.id)
        def players = Player.findAll().sort { - it.getRatingForDiscipline(discipline) }
        players = players[0..<(Math.min(9, players.size()))]
        [players: players, discipline: discipline]
    }
}
