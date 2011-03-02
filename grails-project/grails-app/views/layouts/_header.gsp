<h2><g:link uri="/" title="Back to main page"><g:message code="header.home"/></g:link></h2>

<div id="menu">
    <%-- TODO: Si esta loggeado mostrar su nombre y no este boton --%>
    <div class="headerFBConnect">
        <g:if test="${session.user}"> 
            <g:link style="color: white; font-weight: normal;" controller="player" action="show" params="[id: session.user.id]">${session.user.name}</g:link> | <g:link controller="user" action="logout"><g:message code="auth.logout"/></g:link>
        </g:if><g:else>
            <fb:login-button perms="email,publish_stream" onlogin="facebookLogin();" size="normal">
                <g:message code="auth.login.facebook"/>
            </fb:login-button>
        </g:else>
    </div>

    <div class="headerSearch">
        <g:form controller="match" action="list">
            <g:textField name="matchName" placeholder="${message(code: 'header.search.label')}"/>
        </g:form>
    </div>
</div>

%{--<div id="menu">--}%
%{--<ul>--}%
%{--<li><a href="#" class="current">home</a></li>--}%
%{--<li><a href="#">about</a></li>--}%
%{--<li><a href="#">portofolio</a></li>--}%
%{--<li><a href="#">contact</a></li>--}%
%{--</ul>--}%
%{--</div>--}%



<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
</div>
