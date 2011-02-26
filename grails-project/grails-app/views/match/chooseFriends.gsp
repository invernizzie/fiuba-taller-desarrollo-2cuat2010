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
<g:textField name="ajaxSearchText" /><br />
<div id="chosenFriends"></div>
<div id="results"></div>
</body>
</html>