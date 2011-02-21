<div class="teamList">
    <g:link controller="team" action="show" params="[id: team.id]">
        <h1 class="teamName">${team}</h1>
    </g:link>
    <g:each in="${team.affiliations}" var="affiliation">
        <div class="playerLine">
            <g:link controller="player" action="show" params="[id: affiliation.player.id]">
                ${affiliation.player.user}
            </g:link>
        </div>
    </g:each>
</div>