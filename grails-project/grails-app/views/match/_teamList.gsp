<div class="teamList">
    <g:link controller="team" action="show" params="[id: team.id]">
        <h1 class="teamName">${team}</h1>
    </g:link>
    <g:each in="${team.affiliations}" var="affiliation">
        <div class="playerLine">
            <g:link controller="player" action="show" params="[id: affiliation.player.id]">
                ${affiliation.player.user}
                <div class="rating">
                    <g:each in="${(1..affiliation.player.getRatingForDiscipline(team.discipline) / 2)}">
                        <img src="${request.contextPath}/images/star_icon.png" alt="*" />
                    </g:each>
                </div>
            </g:link>
        </div>
    </g:each>
    <div class="teamActions">
        <g:if test="${!team.complete}">
        <div class="playersNeeded">
            <g:message code='team.playersNeeded.short' args="[team.playersNeeded]"/>
        </div>
        <div class="joinTeam">
            <g:link controller="match" action="teamListJoin" onclick="teamAjaxOnClick(this, ${team.id}); return false;" class="buttonLink">
                <g:message code="team.join.label" />
            </g:link>
        </div>
        </g:if>
    </div>
</div>