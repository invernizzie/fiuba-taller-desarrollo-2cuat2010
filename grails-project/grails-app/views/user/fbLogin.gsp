<html>
<head>
    <title><g:message code="auth.notLogged" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <script type="text/javascript" language="javascript">
        function login() {
            FB.getLoginStatus(function(response) {
                if (response.session) {
                    window.location = '${createLink(controller: callbackController, action: callbackAction) }';
                }
            });
        }
    </script>
</head>
<body>
<div class="bigMessage"><g:message code="auth.mustLogIn" />
    <br /><br />
    <fb:login-button perms="email,publish_stream" onlogin="login();" size="large">
        <g:message code="auth.login.facebook"/>
    </fb:login-button>
</div>
</body>
</html>