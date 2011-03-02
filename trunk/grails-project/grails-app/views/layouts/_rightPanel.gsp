<ul id="nav">
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link controller="match" action="list"><g:message code="match.list.label"/></g:link></li>
    <li><g:link controller="playingField" action="list"><g:message code="playingField.list.label"/></g:link></li>
    <li><g:link controller="player" action="list"><g:message code="player.list.label"/></g:link></li>
    <li><g:link controller="match" action="create"><g:message code="match.organize.label"/></g:link></li>
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