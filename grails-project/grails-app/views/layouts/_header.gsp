<div class="header">
    <%-- TODO: Si esta loggeado mostrar su nombre y no este boton --%>
    <div class="headerFBConnect">
    <g:if test="${session.user}">
        ${session.user.name} | <g:link controller="user" action="logout"><g:message code="auth.logout" /></g:link>
    </g:if><g:else>
        <fb:login-button perms="email,publish_stream" onlogin="facebookLogin();" size="large">
            <g:message code="auth.login.facebook"/>
        </fb:login-button>
    </g:else>
    </div>
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
</div>
