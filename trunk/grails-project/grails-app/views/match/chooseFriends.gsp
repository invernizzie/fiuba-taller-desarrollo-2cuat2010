<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
</head>
<body>
<g:javascript library="ajaxSearch" />
<g:javascript library="friendChooser" />
<script type="text/javascript" language="javascript">

    var liveSearch;
    document.observe("dom:loaded", function() {
        liveSearch = new AjaxLiveSearch.instance({
            url: '${createLink(controller: 'match', action: 'filterFriends')}',
            preserveCase: true
        });
    });

</script>
<div class="friendChooserRoot">
    <div id="chosenFriends" class="chosenFriends"></div>
    <div class="friendFilter">
        <g:textField name="ajaxSearchText" /><br />
        <div id="results" class="filteredFriends"></div>
    </div>
</div>
</body>
</html>