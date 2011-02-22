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
    <div class="teamActions">
        <g:if test="${!team.complete}">
        <div class="joinTeam">
            <g:link controller="match" action="teamListJoin" onclick="onAjaxLinkClick(this, ${team.id}); return false;" >
                <img src="${request.contextPath}/images/plus_icon.png" alt="<g:message code="team.join.label" />"><g:message code="team.join.label" />
            </g:link>
            <script type="text/javascript" language="javascript">
                function onAjaxLinkClick(_this, teamId) {
                    new Ajax.Updater(
                        {
                            success: 'teamList${team.id}',
                            failure:'message'
                        },
                        _this.href,
                        {
                            asynchronous:true,
                            evalScripts:true,
                            parameters:'team.id=' + teamId,
                            on500: showMessages
                        });
                    return false;
                }
                function showMessages() {
                    $('message').show();
                }
            </script>
            <%--
            <g:remoteLink controller="match" action="teamListJoin" params="['team.id': team.id]" update='[success: "teamList${team.id}", failure: "message"]' on500="\$('message').show();">
                <img src="${request.contextPath}/images/plus_icon.png" alt="<g:message code="team.join.label" />"><g:message code="team.join.label" />
            </g:remoteLink>
            --%>
        </div>
        </g:if>
    </div>
</div>