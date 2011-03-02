package teambook

class ApplicationFilters {

    def matchService

    def filters = {
        all(controller:'*', action:'*') {
            after = {
                request.incomingMatches = matchService.findIncomingMatches(5)
            }
        }
    }
    
}
