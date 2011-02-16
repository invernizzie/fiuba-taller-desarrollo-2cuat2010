<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
    <head>
        <title><g:layoutTitle default="Teambook" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="prototype" />
        <%--<fbg:resources />--%>
        <script type="text/javascript">
        function facebookLogin() {
            FB.getLoginStatus(function(response) {
                if (response.session) {
                    alert("UID: " + response.session.uid + "\nAccess token: " + response.session.access_token);
                    // logged in and connected user, someone you know
                    //window.location ="${createLink(controller:'auth', action:'facebookLogin')}";
                }
            });
        }
    </script>
    </head>
    <body>
        <div id="fb-root"></div>
        <script src="http://connect.facebook.net/en_US/all.js"></script>
        <script>
            FB.init({appId: '141844382523320', cookie: true, xfbml: true});
        </script>
        <div class="content">
            <div class="header">
                <div id="spinner" class="spinner" style="display:none;">
                    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                </div>
                <div class="layoutHeader">
                    <g:link uri="/"><g:message code="header.home" /></g:link>
                </div>
                <div class="headerSearch">
                    <g:form controller="match" action="list">
                        <g:textField name="matchName" value="${message(code: 'header.search.label')}" onfocus="replaceQuery(this)" />
                    </g:form>
                </div>
                <fb:login-button perms="email,publish_stream" onlogin="facebookLogin();" size="large">
                    <g:message code="auth.login.facebook"/>
                </fb:login-button>
            </div>
            <g:layoutBody />
            <g:render template="/layouts/footer" />
        </div>
    </body>
</html>
