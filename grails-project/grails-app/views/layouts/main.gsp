<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="en" lang="en">
<head>
    <title><g:layoutTitle default="Teambook"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"/>

    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="author" content="Pepe"/>
    <meta name="description" content="Site description"/>
    <meta name="keywords" content="key, words"/>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

    <g:javascript library="application"/>
    <g:javascript library="prototype"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
    <g:javascript>
        $.noConflict();
        // Now jQuery must be accessed with 'jQuery' instead of '$'.
    </g:javascript>

    <script type="text/javascript">
        function facebookLogin() {
            FB.getLoginStatus(function(response) {
                if (response.session) {
                    window.location = "${createLink(controller: 'user', action:'fbLogin')}";
                }
            });
        }
    </script>
</head>

<body>
<div id="fb-root"></div>
<script src="http://connect.facebook.net/en_US/all.js"></script>
<script>
    FB.init({appId: '${ConfigurationHolder.config.facebook.applicationId}', cookie: true, xfbml: true});
</script>

<div id="wrap">
    <div id="top">
        <g:render template="/layouts/header"/>
    </div>
    <div id="content">
        <div id="left">
            <g:layoutBody/>
        </div>
        <div id="right">
            <g:render template="/layouts/rightPanel"/>
        </div>
    </div>
    <div id="clear"></div>
    <div id="footer">
        <g:render template="/layouts/footer"/>
    </div>
</div>

</body>
</html>

