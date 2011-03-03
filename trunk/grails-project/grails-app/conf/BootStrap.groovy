import grails.converters.JSON
import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.teambook.model.*

class BootStrap {

    def userService
    def ratingService

    def users = []

    Random random = new Random(new Date().time)

    def init = { servletContext ->

        if (GrailsUtil.environment == 'test')
            return

        def football = new Discipline(name: "Futbol 5", playersPerTeam: 5, tieable: true)
        def singlesTennis = new Discipline(name: "Tenis singles", playersPerTeam: 1, tieable: false)
        def doublesTennis = new Discipline(name: "Tenis dobles", playersPerTeam: 2, tieable: false)
        def basket = new Discipline(name: 'Basket', playersPerTeam: 5, tieable: true)
        def volleyball = new Discipline(name: 'Voley', playersPerTeam: 6, tieable: true)
        def disciplines = [football, singlesTennis, doublesTennis, basket, volleyball]
        disciplines.each { it.save(failOnError: true) }

        def palermo = user('154804461414')
        def burrito = user('30474505823')
        def federer = user('64760994940')
        def nalbandian = user('1727091423')

        def footballField = playingField('Futbol 5 Alto Pasto', 'Argentina', 'Ing. Pablo Nogues', 'Suiza 1840', [football], 'futbol1.jpg')
        def tennisField = playingField('Lawn Tennis Club', 'Argentina', 'Capital Federal', 'Olleros 1510', [singlesTennis, doublesTennis], 'tenis1.jpg')
        // TODO Add pictures
        def sportsCenter = playingField('Polideportivo Dorrego', 'Argentina', 'Capital Federal', 'Oruro 1300', [volleyball, basket, singlesTennis])
        def basketField = playingField('Club Italiano', 'Argentina', 'Capital Federal', 'Av. Rivadavia 4731', [basket, volleyball])
        List<PlayingField> fields = [footballField, tennisField, sportsCenter, basketField]

        def bocaJrs = team('Boca Jrs.', football, [palermo])
        def riverPlate = team('River Plate', football, [burrito])
        def federerSingles = team('Roger Federer', singlesTennis, [federer])
        def nalbandianSingles = team('Nalbandian', singlesTennis, [nalbandian])

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

        match(  'Tenis el sabado', nalbandian,
                nalbandianSingles, federerSingles,
                tennisField, outcome: Outcome.LOCAL_WON,
                score: '6-4, 3-6, 6-3', date: yesterday)
        match(  'Mano a mano - tenis', federer,
                nalbandianSingles, federerSingles, tennisField)
        match(  'Picado + asado', palermo,
                bocaJrs, riverPlate,
                sportsCenter, date: calendar(5, 3, 2011))

        rating(from: palermo, to: federer, discipline: singlesTennis, rating: 10)
        rating(from: palermo, to: nalbandian, discipline: singlesTennis, rating: 9)
        rating(from: palermo, to: nalbandian, discipline: doublesTennis, rating: 7)
        rating(from: federer, to: palermo, discipline: football, rating: 7)
        rating(from: federer, to: nalbandian, discipline: singlesTennis, rating: 9)
        rating(from: nalbandian, to: palermo, discipline: football, rating: 5)
        rating(from: nalbandian, to: federer, discipline: singlesTennis, rating: 10)
        rating(from: nalbandian, to: federer, discipline: doublesTennis, rating: 8)

        if (!ConfigurationHolder.config.loadFullData)
            return
        
        JSON.parse(facebookUsersToLoad).each {
            user(it.id)
        }

        // Generacion de Ratings
        users.each { user ->
            10.times {
                rating(
                        from: user,
                        to: users[random.nextInt(users.size())],
                        discipline: disciplines[random.nextInt(disciplines.size())],
                        rating: random.nextInt(10) )
            }
        }

        def italianoBasket = team('Italiano Basket', basket, randomlySelectUsers(5))
        def espaniolBasket = team('Club Español Basket', basket, randomlySelectUsers(4))

        match(  '3ra fecha Copa De Tinto', italianoBasket.affiliations.iterator().next().player.user,
                italianoBasket, espaniolBasket, basketField, date: calendar(10, 3, 2011))

        // Generacion automatica de partidos para rellenar
        10.times {
            Discipline discipline = disciplines[random.nextInt(disciplines.size())]
            List<User> localUsers = randomlySelectUsers(discipline.playersPerTeam)
            List<User> awayUsers = randomlySelectUsers(discipline.playersPerTeam)
            Team local = team("Autogenerado ${it*2}", discipline, localUsers)
            Team away = team("Autogenerado ${it*2+1}", discipline, awayUsers)
            PlayingField field = fields.find { field ->
                field.availableDisciplines.contains(discipline)
            }
            def day = random.nextInt(28) + 1
            def month = random.nextInt(12) + 1
            def year = random.nextInt(3) + 2010
            match(  "Autogenerado $it", localUsers[0],
                    local, away, field, date: calendar(day, month, year))
        }
    }

    Calendar calendar(day, month, year) {
        def calendar = Calendar.instance
        calendar.setTime(Date.parse('d-M-y', "${day}-${month}-${year}"))
        return calendar
    }

    // Random-length match
    Match match(Map optionalParams = [:], String name, User owner, Team local, Team away, PlayingField field) {
        def startingDate = optionalParams.date ?: Calendar.instance
        def endingDate = startingDate.clone()
        endingDate.add(Calendar.HOUR_OF_DAY, random.nextInt(4))
        new Match(
                name: name,
                startingTime: startingDate.time,
                endingTime: endingDate.time,
                publicMatch: true,
                owner: owner,
                localTeam: local,
                awayTeam: away,
                field: field,
                outcome: optionalParams.outcome,
                score: optionalParams.score,
                discipline: local.discipline).save(failOnError: true)
    }

    List<User> randomlySelectUsers(amount) {
        def selectedUsers = []
        amount.times {
            selectedUsers << users[random.nextInt(users.size())]
        }
        return selectedUsers
    }

    PlayingField playingField(String name, String country, String city, String address, List<Discipline> disciplines, String photoPath = '') {
        new PlayingField(
                name: name,
                photoPath: photoPath,
                country: country,
                city: city,
                address: address,
                availableDisciplines: disciplines).save(failOnError: true)
    }

    Rating rating(p) {
        ratingService.addOrUpdate(p.to.player, p.from, p.discipline, p.rating)
    }

    Team team(String name, Discipline discipline, List<User> users) {
        def team = new Team(name: name, discipline: discipline)
        users*.player.each { player ->
            team.addToAffiliations(new Affiliation(player: player, team: team))
        }
        team.save(failOnError: true)
    }

    User user(String facebookUid) {
        def user = userService.findOrCreateByFbUidWithoutSession(facebookUid)
        users << user
        return user
    }

    def facebookUsersToLoad =
        """[
              {
                 "name": "Juan Camilli",
                 "id": "518393525"
              },
              {
                 "name": "Esteban Bonaveri",
                 "id": "524502815"
              },
              {
                 "name": "Alejandro Biasin",
                 "id": "525188716"
              },
              {
                 "name": "Diego Garc\u00eda Jaime",
                 "id": "525532889"
              },
              {
                 "name": "Guido Ricaldoni",
                 "id": "527097874"
              },
              {
                 "name": "Tete Costa",
                 "id": "527163571"
              },
              {
                 "name": "Vane Morrone",
                 "id": "529316062"
              },
              {
                 "name": "Luciano Maciel",
                 "id": "533770621"
              },
              {
                 "name": "Maximiliano Ota\u00f1o",
                 "id": "533784002"
              },
              {
                 "name": "Agus Brittes Mazza",
                 "id": "539903879"
              },
              {
                 "name": "Camila Barros Mendez",
                 "id": "540173926"
              },
              {
                 "name": "Beluu Acevedo",
                 "id": "558888669"
              },
              {
                 "name": "Chechu Gomez Roda",
                 "id": "570237474"
              },
              {
                 "name": "Yamila Schab",
                 "id": "579464405"
              },
              {
                 "name": "Leandro Ezequiel Paulini",
                 "id": "579552627"
              },
              {
                 "name": "Mayra Riccardi",
                 "id": "588406271"
              },
              {
                 "name": "Horacio Cucho Gomez",
                 "id": "589063311"
              },
              {
                 "name": "Ariel Pozzo",
                 "id": "589174840"
              },
              {
                 "name": "So Campagnoli",
                 "id": "621497539"
              },
              {
                 "name": "Gabriela Stachurski",
                 "id": "639518233"
              },
              {
                 "name": "July D'Andrea",
                 "id": "654734646"
              },
              {
                 "name": "Lety Morales",
                 "id": "666898629"
              },
              {
                 "name": "Laureana Soledad Anile",
                 "id": "673537877"
              },
              {
                 "name": "Gustavo Meller",
                 "id": "677534335"
              },
              {
                 "name": "Agust\u00edn Fiorenza",
                 "id": "688101311"
              },
              {
                 "name": "Ro Cariglino",
                 "id": "691686695"
              },
              {
                 "name": "Federico Racciatti",
                 "id": "693857290"
              },
              {
                 "name": "Florencia Lapelosa",
                 "id": "694764128"
              },
              {
                 "name": "Ju Cardone",
                 "id": "700667542"
              },
              {
                 "name": "Eva Ditomaso",
                 "id": "702982657"
              },
              {
                 "name": "Estefania Yanel D'Amico",
                 "id": "719698805"
              },
              {
                 "name": "Dani Piemonte",
                 "id": "731509406"
              },
              {
                 "name": "Eva Loiacono",
                 "id": "742943916"
              },
              {
                 "name": "Malena Rossi",
                 "id": "746869823"
              },
              {
                 "name": "Facundo Giampaoli",
                 "id": "755641461"
              },
              {
                 "name": "Nicol\u00e1s Ganam",
                 "id": "768598377"
              },
              {
                 "name": "Matias Puppi",
                 "id": "777737696"
              },
              {
                 "name": "Lucas Cambao da Silva",
                 "id": "780160111"
              },
              {
                 "name": "Jes Persello Valle",
                 "id": "782025849"
              },
              {
                 "name": "Lorena Codianni",
                 "id": "822392589"
              },
              {
                 "name": "Paula Roetto",
                 "id": "823794394"
              },
              {
                 "name": "Dai Spengler",
                 "id": "835842066"
              },
              {
                 "name": "Mariana Fresno",
                 "id": "851985242"
              },
              {
                 "name": "Celes Fourmentel",
                 "id": "1002338182"
              },
              {
                 "name": "Nadia Ryzio",
                 "id": "1017114976"
              },
              {
                 "name": "Ramiro Marcelo Riveiro",
                 "id": "1035370589"
              },
              {
                 "name": "Mandarina Herer",
                 "id": "1036325790"
              },
              {
                 "name": "Loa Modola",
                 "id": "1037029100"
              },
              {
                 "name": "Anto Sborlini",
                 "id": "1042269582"
              },
              {
                 "name": "Julieta Rosales",
                 "id": "1050998274"
              },
              {
                 "name": "Mariano Gaspari",
                 "id": "1057814187"
              },
              {
                 "name": "Irene Carrea",
                 "id": "1060958905"
              },
              {
                 "name": "Luis Marchese",
                 "id": "1066004935"
              },
              {
                 "name": "Le\u00f3n Saia",
                 "id": "1066730425"
              },
              {
                 "name": "Yago Ardel Howard",
                 "id": "1067914832"
              },
              {
                 "name": "Tatiana Alejandra Prieto",
                 "id": "1070787692"
              },
              {
                 "name": "Juan Ignacio Marchese",
                 "id": "1077971005"
              },
              {
                 "name": "Fity Bellomo",
                 "id": "1078352479"
              },
              {
                 "name": "Facundo Frey",
                 "id": "1079997659"
              },
              {
                 "name": "Mariel Fernandez",
                 "id": "1090970560"
              },
              {
                 "name": "Leandro Ferrigno",
                 "id": "1096614711"
              },
              {
                 "name": "Martin Mu\u00f1oz",
                 "id": "1109595282"
              },
              {
                 "name": "Mony Leiva",
                 "id": "1110814920"
              },
              {
                 "name": "Ramiro Burgio",
                 "id": "1113014161"
              },
              {
                 "name": "Christian Baalbaki",
                 "id": "1125321780"
              },
              {
                 "name": "Marcos Gomez",
                 "id": "1132902662"
              },
              {
                 "name": "Ayel\u00e9n Ziegler",
                 "id": "1136809205"
              },
              {
                 "name": "Corina Sturtz",
                 "id": "1143865778"
              },
              {
                 "name": "Eliaanitaa Miguel",
                 "id": "1145552528"
              },
              {
                 "name": "Tsunico Bar",
                 "id": "1148347512"
              },
              {
                 "name": "Carla Pomponio",
                 "id": "1152245224"
              },
              {
                 "name": "Victoria Camila Yorio",
                 "id": "1156976895"
              },
              {
                 "name": "Carlita Mercado",
                 "id": "1161004861"
              },
              {
                 "name": "Santi Suarez",
                 "id": "1162544000"
              },
              {
                 "name": "Jordan Molinari",
                 "id": "1162583272"
              },
              {
                 "name": "Marce Ciarlantini",
                 "id": "1163643804"
              },
              {
                 "name": "Katia Forchetti",
                 "id": "1165963335"
              },
              {
                 "name": "Rocio Quinteros",
                 "id": "1167979262"
              },
              {
                 "name": "Gabriel Agust\u00edn Camilli",
                 "id": "1168722038"
              },
              {
                 "name": "Fernando Fity Bellomo",
                 "id": "1172349859"
              },
              {
                 "name": "Ceci Rodriguez Lacorte",
                 "id": "1176063997"
              },
              {
                 "name": "Ale Fab",
                 "id": "1176372962"
              },
              {
                 "name": "Aldana Zavagna",
                 "id": "1176623837"
              },
              {
                 "name": "Maria Iara Amore",
                 "id": "1179062125"
              },
              {
                 "name": "Alumine Olivera",
                 "id": "1181122767"
              },
              {
                 "name": "Alan Ardel Howard",
                 "id": "1182396962"
              },
              {
                 "name": "Priscila Antu\u00f1a",
                 "id": "1185438717"
              },
              {
                 "name": "Michu Damico",
                 "id": "1186466408"
              },
              {
                 "name": "Gonzalo Mazzoni",
                 "id": "1197970109"
              },
              {
                 "name": "Julieta Boyer",
                 "id": "1200963515"
              },
              {
                 "name": "Marcelo Greco",
                 "id": "1204331986"
              },
              {
                 "name": "Julieta Cambaceres",
                 "id": "1219562954"
              },
              {
                 "name": "Ger Brazao",
                 "id": "1230733810"
              },
              {
                 "name": "Juan Carlos Deriane",
                 "id": "1236227845"
              },
              {
                 "name": "Lau Cicirelli",
                 "id": "1258967625"
              },
              {
                 "name": "Diego Maximiliano Suarez",
                 "id": "1261478694"
              },
              {
                 "name": "Mauro Tallarico",
                 "id": "1269278494"
              },
              {
                 "name": "Facu Conde",
                 "id": "1269908898"
              },
              {
                 "name": "Lara Mu\u00f1iz",
                 "id": "1277210072"
              },
              {
                 "name": "Sol Flores",
                 "id": "1281807930"
              },
              {
                 "name": "Nahuel Gonzalez",
                 "id": "1283927927"
              },
              {
                 "name": "Pablo Tassara",
                 "id": "1289927665"
              },
              {
                 "name": "Ximena Burgio",
                 "id": "1293375889"
              },
              {
                 "name": "Enzo Cariglino",
                 "id": "1300674489"
              },
              {
                 "name": "Florencia Sorichetti",
                 "id": "1313841690"
              },
              {
                 "name": "Matias A. Dominguez",
                 "id": "1321344080"
              },
              {
                 "name": "Gonzalo Nahuel Tysko",
                 "id": "1324000216"
              },
              {
                 "name": "Jere Tucci",
                 "id": "1325598318"
              },
              {
                 "name": "Eliana Pasquale",
                 "id": "1340450022"
              },
              {
                 "name": "Juan Pablo Sosa",
                 "id": "1344619976"
              },
              {
                 "name": "Claudio Medina",
                 "id": "1348055462"
              },
              {
                 "name": "Noe Pasquale",
                 "id": "1351704756"
              },
              {
                 "name": "Mar\u00eda Bel\u00e9n Cecchi",
                 "id": "1351805560"
              },
              {
                 "name": "Caro Ventosa",
                 "id": "1366385510"
              },
              {
                 "name": "Maru Balin",
                 "id": "1368370337"
              },
              {
                 "name": "David Draise",
                 "id": "1374635478"
              },
              {
                 "name": "Fabian Damico",
                 "id": "1383460917"
              },
              {
                 "name": "Celeste Magallanes",
                 "id": "1386665441"
              },
              {
                 "name": "Jonatan Bentancor",
                 "id": "1387805515"
              },
              {
                 "name": "Martin Catalan Berce",
                 "id": "1388735480"
              },
              {
                 "name": "Julii Cambaoo",
                 "id": "1389635349"
              },
              {
                 "name": "Octavio Tallarico",
                 "id": "1403297986"
              },
              {
                 "name": "Luis Oberndorfer",
                 "id": "1405953933"
              },
              {
                 "name": "Matias Sebastian Sorichetti",
                 "id": "1406659833"
              },
              {
                 "name": "Gabriel Genre",
                 "id": "1410019271"
              },
              {
                 "name": "Nico Fernandez",
                 "id": "1412816547"
              },
              {
                 "name": "Nat Alia",
                 "id": "1416043872"
              },
              {
                 "name": "Nahuel Peretti",
                 "id": "1435726904"
              },
              {
                 "name": "Luz Elissalde",
                 "id": "1436807223"
              },
              {
                 "name": "Nadia Quinteros",
                 "id": "1437549867"
              },
              {
                 "name": "Mar Cariglino",
                 "id": "1439728040"
              },
              {
                 "name": "Nahuel Quevedo",
                 "id": "1440807667"
              },
              {
                 "name": "Seba Toni",
                 "id": "1446737077"
              },
              {
                 "name": "Carolina Vanesa Molinero",
                 "id": "1458371674"
              },
              {
                 "name": "Leandro Sebastian Romero",
                 "id": "1469973617"
              },
              {
                 "name": "Pablo Barrientos",
                 "id": "1495331325"
              },
              {
                 "name": "Rodrigo Loly Correa",
                 "id": "1496110708"
              },
              {
                 "name": "Juan Pablo Bellomo",
                 "id": "1497326037"
              },
              {
                 "name": "Daniel Rolla",
                 "id": "1498225519"
              },
              {
                 "name": "Agustin Kelly",
                 "id": "1500602889"
              },
              {
                 "name": "Gaston Agustin De Tone",
                 "id": "1506461258"
              },
              {
                 "name": "Maxi Graham",
                 "id": "1527134138"
              },
              {
                 "name": "Maria Del Cielo Silva",
                 "id": "1541923340"
              },
              {
                 "name": "Maru Invidiato",
                 "id": "1554619104"
              },
              {
                 "name": "Nicolas Juan Carrea",
                 "id": "1560812549"
              },
              {
                 "name": "El Chipi Say",
                 "id": "1577229209"
              },
              {
                 "name": "Ailin Ludue\u00f1a",
                 "id": "1585141636"
              },
              {
                 "name": "Tierra F\u00e9rtil Reggae",
                 "id": "1600862997"
              },
              {
                 "name": "Sandra Forchetti",
                 "id": "1631621533"
              },
              {
                 "name": "Estela Invernizzi",
                 "id": "1633647515"
              },
              {
                 "name": "Holy Mary",
                 "id": "1633676000"
              },
              {
                 "name": "Sandra Chandare",
                 "id": "1635151406"
              },
              {
                 "name": "Matias Pais",
                 "id": "1649304221"
              },
              {
                 "name": "Franco Martin Fiorenza",
                 "id": "1657545960"
              },
              {
                 "name": "Pat Coscia",
                 "id": "1664805950"
              },
              {
                 "name": "Miguel \u00c1ngel D \u00c1mico",
                 "id": "1800947858"
              },
              {
                 "name": "Flopy Melagna",
                 "id": "1849925385"
              },
              {
                 "name": "Pepii Lillo",
                 "id": "100000065824180"
              },
              {
                 "name": "Juli de Lillo",
                 "id": "100000187916190"
              },
              {
                 "name": "Jonathan Damico",
                 "id": "100000295644122"
              },
              {
                 "name": "Nilda Kempf",
                 "id": "100000349021814"
              },
              {
                 "name": "Anto Macri",
                 "id": "100000422362378"
              },
              {
                 "name": "Ezequiel Medina",
                 "id": "100000510797538"
              },
              {
                 "name": "Mas A Mi Favor",
                 "id": "100000821740452"
              },
              {
                 "name": "Canela Desayunos",
                 "id": "100001167263510"
              },
              {
                 "name": "Miguel Angel D'amico",
                 "id": "100001285279941"
              },
              {
                 "name": "Edificio Victoria",
                 "id": "100001784199916"
              },
              {
                 "name": "Sportivo Pace\u00f1o",
                 "id": "100001850062338"
              }
        ]"""

    def destroy = {
    }
}
