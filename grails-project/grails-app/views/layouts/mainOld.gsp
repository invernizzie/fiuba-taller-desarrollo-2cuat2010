<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
    <head>
        <title><g:layoutTitle default="Teambook" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />

        %{--Very important to include jquery before prototype!!--}%
        <g:javascript library="slides.min.jquery"/> 
        <g:javascript library="application" />
        <g:javascript library="prototype" />

        <script type="text/javascript">
            function facebookLogin() {
                FB.getLoginStatus(function(response) {
                    if (response.session) {
                        window.location ="${createLink(controller: 'user', action:'fbLogin')}";
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
        <div class="content">
            <g:render template="/layouts/header" />
            <g:layoutBody />
            <g:render template="/layouts/footer" />
        </div>
    </body>
</html>
