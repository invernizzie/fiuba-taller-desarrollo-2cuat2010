<div class="teamList">
    <g:link controller="team" action="show" params="[id: team.id]">
        <h1 class="teamName">${team}</h1>
    </g:link>
    <g:each in="${team.affiliations}" var="affiliation">
        <div class="playerLine">
            <g:link controller="player" action="show" params="[id: affiliation.player.id]">
                ${affiliation.player.user}
            </g:link>
            <div class="rating">
            <g:set var="rating" value="${affiliation.player.getRatingForDiscipline(team.discipline)}" />
            <g:each in="${1..5}" >
                <g:set var="i" value="${it}" />
                <g:link controller="match" action="ratePlayer"
                        params="['discipline.id': team.discipline.id, 'player.id': affiliation.player.id, rating: i*2]"
                        title="${i}/5" onclick="return teamAjaxOnClick(this, ${team.id}, ${match?.id ?: ''});">
                    <img src="${resource(dir: 'images', file: 'star_icon' + (i > (rating / 2) ? '_gray' : '') + '.png')}" onmouseover="highlightStar(this);" onmouseout="dimStar(this);" alt="${i > rating / 2 ? '' : '*'}" />
                </g:link>
            </g:each>
        </div>
        </div>
    </g:each>
    <div class="teamActions">
        <g:if test="${!team.complete}">
        <div class="playersNeeded">
            <g:message code='team.playersNeeded.short' args="${[team.playersNeeded, (team.playersNeeded > 1 ? 'n' : '')]}"/>
        </div>
        <div class="joinTeam">
            <g:link controller="match" action="teamListJoin" onclick="return teamAjaxOnClick(this, ${team.id}, ${match?.id ?: ''});" class="imageLink plusLink">
                <g:message code="team.join.label" />
            </g:link>
        </div>
        <div class="addPlayers">
        <g:if test="${match}">
            <g:link controller="match" action="chooseFriends" params="[teamId: team.id, matchId: match.id]" class="imageLink friendsLink">
                <g:message code="team.addPlayers.label" />
            </g:link>
        </g:if>
    </div>
    </g:if>
    </div>
</div>