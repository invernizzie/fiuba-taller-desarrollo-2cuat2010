<ul id="nav">
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link controller="match">Matches</g:link></li>
    <li><g:link controller="playingField">Playing Fields</g:link></li>
    <li><g:link controller="player">Players</g:link></li>
    <li><g:link controller="match" action="create"><g:message code="match.organize.label"/></g:link></li>
    <li><a href="main.gsp#download">Rate a player</a></li>
    <li><a href="main.gsp#support">Join a Match</a></li>
    <li><a href="main.gsp#contact">Announce your renting field in the homepage</a></li>
</ul>
<div class="box">
    <h2 style="margin-top:17px">Incoming matches</h2>
    <ul>
        <g:each in="${incomingMatches}" var="match">
            <li>
                <g:link controller="match" action="show" params="[id: match.id]">${match.name}</g:link>
                <i>${match.startingTime}</i>
            </li>
        </g:each>
    </ul>
</div>