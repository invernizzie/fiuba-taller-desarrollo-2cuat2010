import com.teambook.model.*

class BootStrap {

    def init = { servletContext ->
        def football = new Discipline(name: "Futbol 5", playersPerTeam: 5, tieable: true)
        def singlesTennis = new Discipline(name: "Tenis singles", playersPerTeam: 1, tieable: false)
        def doublesTennis = new Discipline(name: "Tenis dobles", playersPerTeam: 2, tieable: false)
        def disciplines = [football, singlesTennis, doublesTennis]
        disciplines.each { it.save(failOnError: true) }

        def playerPalermo = new Player()
        def playerFederer = new Player()
        def playerNalbandian = new Player()
        def users = []
        users.add(new User(
                facebookUid: 1,
                username: 'user1',
                name: 'Roger Federer',
                birthday: Date.parse('d-M-yyyy', '20-7-1975'),
                email: 'roger@email.com',
                player: playerFederer))
        users.add(new User(
                facebookUid: 2,
                username: 'user2',
                name: 'David Nalbandian',
                birthday: Date.parse('d-M-yyyy', '12-4-1983'),
                email: 'nalby@aat.com.ar',
                player: playerNalbandian))

        def userPalermo = new User(
                facebookUid: 3,
                username: 'user3',
                name: 'Martin Palermo',
                birthday: Date.parse('d-M-yyyy', '7-11-1973'),
                email: 'mpalermo@bocajrs.com.ar',
                player: playerPalermo
        )
        users.add(userPalermo)
        users.each { it.save(failOnError: true) }

        new PlayingField(
                name: 'Cancha de futbol 5',
                photoPath: 'futbol1.jpg',
                city: 'Capital Federal',
                country: 'Argentina',
                address: 'Suiza 1840',
                availableDisciplines: [football]).save(failOnError: true)
        def tennisField = new PlayingField(
                name: 'Club de tenis',
                photoPath: 'tenis1.jpg',
                city: 'Capital Federal',
                country: 'Argentina',
                address: 'Jose Hernandez 2930 entre Martin Fierro y Sgto. Cruz',
                availableDisciplines: [singlesTennis, doublesTennis])
        tennisField.save(failOnError: true)

        def teams = []
        def teamBoca = new Team(
                name: 'Boca Junios',
                discipline: football)
        teamBoca.addToAffiliations new Affiliation(player: playerPalermo)
        teams.add(teamBoca)

        def teamFederer = new Team(
                name: 'Federer singles',
                discipline: singlesTennis)
        teamFederer.addToAffiliations new Affiliation(player: playerFederer)
        teams.add teamFederer

        def teamNalbandian = new Team(
                name: 'Nalbandian singles',
                discipline: singlesTennis)
        teamNalbandian.addToAffiliations new Affiliation(player: playerNalbandian)
        teams.add teamNalbandian

        teams.each { it.save(failOnError: true) }

        def today = Calendar.instance
        def yesterday = today.clone()
        yesterday.add(Calendar.DAY_OF_YEAR, -1)
        def yesterdayPlusOneHour = yesterday.clone()
        yesterdayPlusOneHour.add(Calendar.HOUR_OF_DAY, 1)
        def maniana = Calendar.instance
        maniana.add(Calendar.DAY_OF_YEAR, 1)
        def manianaYUnaHora = Calendar.instance
        manianaYUnaHora.add(Calendar.DAY_OF_YEAR, 1)
        manianaYUnaHora.add(Calendar.HOUR, 1)

        new Match(
                name: "Tenis el sabado",
                startingTime: yesterday.time,
                endingTime: yesterdayPlusOneHour.time,
                publicMatch: true,
                owner: users[0],
                localTeam: teams[1],
                awayTeam: teams[2],
                field: tennisField,
                outcome: Outcome.LOCAL_WON,
                score: '6-4, 3-6, 6-3',
                discipline: teams[1].discipline).save(failOnError: true)
        new Match(
                name: "Mano a mano",
                startingTime: maniana.time,
                endingTime: manianaYUnaHora.time,
                publicMatch: true,
                owner: users[0],
                localTeam: teams[1],
                awayTeam: teams[0],
                field: tennisField,
                discipline: teams[0].discipline).save(failOnError: true)
        new Match(
                name: "Fulbacho",
                startingTime: maniana.time,
                endingTime: manianaYUnaHora.time,
                publicMatch: true,
                owner: users[1],
                localTeam: teams[2],
                awayTeam: teams[1],
                field: tennisField,
                discipline: teams[2].discipline).save(failOnError: true)

        def ratings = []
        ratings.add(new Rating(
                user: userPalermo,
                player: playerFederer,
                discipline: football,
                rating: 5
        ))
        ratings.add(new Rating(
                user: userPalermo,
                player: playerFederer,
                discipline: football,
                rating: 4
        ))
        ratings.add(new Rating(
                user: userPalermo,
                player: playerFederer,
                discipline: football,
                rating: 1
        ))
        ratings.add(new Rating(
                user: userPalermo,
                player: playerFederer,
                discipline: singlesTennis,
                rating: 2
        ))
        ratings.add(new Rating([
                player: playerPalermo,
                discipline: football,
                user: users[0],
                rating: 8
        ]))
        ratings.add(new Rating([
                player: playerPalermo,
                discipline: football,
                user: users[1],
                rating: 9
        ]))
        ratings.each { it.save(failOnError: true) }
    }
    def destroy = {
    }
}
