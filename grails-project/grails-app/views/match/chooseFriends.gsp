<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code='team.addPlayers.title' args="[team]" /></title>
</head>
<body>
<g:javascript library="ajaxSearch" />
<g:javascript library="friendChooser" />
<script type="text/javascript" language="javascript">

    var liveSearch;
    var friendChooser;

    document.observe("dom:loaded", function() {
        liveSearch = new AjaxLiveSearch.instance({
            url: '${createLink(controller: 'match', action: 'filterFriends')}',
            preserveCase: true
        });
        friendChooser = new FriendChooser({
            listDiv: 'chosenFriends',
            chosenClass: 'fbFriendChosen',
            maxFriends: ${team.playersNeeded},
            onChange: updateFriendsForm
        });
    });

    function updateFriendsForm(chosen) {
        $('selectionForm')['selectedFriends'].value = JSON.stringify(chosen);
    }

</script>
<h1><g:message code='team.addPlayers.title' args="[team]" /></h1>
<g:message code="team.addPlayers.startTyping.label" /><br />
<div class="friendChooserRoot">
    <div class="chosenFriends">
        <div id="chosenFriends" ></div>
        <a href="javascript: $('selectionForm').submit();"><g:message code="team.addPlayers.confirm.label" /></a>
        <g:form controller="team" action="addPlayers" name="selectionForm">
            <g:hiddenField name="teamId" value="${team.id}" />
            <g:if test="match">
                <g:hiddenField name="matchId" value="${match.id}" />
            </g:if>
            <g:hiddenField name="selectedFriends" value="" />
        </g:form>
    </div>
    <div class="friendFilter">
        <g:textField name="ajaxSearchText" /><br />
        <div id="results" class="filteredFriends"></div>
    </div>
</div>
</body>
</html>