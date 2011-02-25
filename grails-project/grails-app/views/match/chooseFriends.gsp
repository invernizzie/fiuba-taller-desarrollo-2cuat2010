<g:javascript library="prototype" />
<g:javascript library="ajaxSearch" />
<script type="text/javascript" language="javascript">

    var liveSearch;
    document.observe("dom:loaded", function() {
        liveSearch = new AjaxLiveSearch.instance({
            url: '${createLink(controller: 'match', action: 'chooseFriends')}',
            preserveCase: true
        })
    });

</script>
<g:textField name="ajaxSearchText" /><br />
<div id="results"></div>