<ul id="nav">
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link controller="match" action="list"><g:message code="match.list.label"/></g:link></li>
    <li><g:link controller="playingField" action="list"><g:message code="playingField.list.label"/></g:link></li>
    <li><g:link controller="player" action="list"><g:message code="player.list.label"/></g:link></li>
    <li><g:link controller="match" action="create"><g:message code="match.organize.label"/></g:link></li>
    <li><g:link controller="ranking" action="show" params="['discipline.id': 1]"><g:message code="rankings.football.label" /></g:link></li>
</ul>


<div id="fotoDeportes">
    <img src="${createLinkTo(dir:'images', file:'fotoChica.jpg')}" />
</div>



<div class="box">
    <h2 style="margin-top:17px"><g:message code="match.incoming.label"/></h2>
    <ul>
        <g:each in="${incomingMatches}" var="match">
            <li>
                <g:link controller="match" action="show" params="[id: match.id]">${match.name}</g:link>
                <br /><i><g:formatDate date="${match.startingTime}" /></i>
            </li>
        </g:each>
    </ul>
</div>
