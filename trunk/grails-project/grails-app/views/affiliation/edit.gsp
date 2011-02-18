

<%@ page import="com.teambook.model.Affiliation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'affiliation.label', default: 'Affiliation')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${affiliationInstance}">
            <div class="errors">
                <g:renderErrors bean="${affiliationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${affiliationInstance?.id}" />
                <g:hiddenField name="version" value="${affiliationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="team"><g:message code="affiliation.team.label" default="Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affiliationInstance, field: 'team', 'errors')}">
                                    <g:select name="team.id" from="${com.teambook.model.Team.list()}" optionKey="id" value="${affiliationInstance?.team?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="player"><g:message code="affiliation.player.label" default="Player" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affiliationInstance, field: 'player', 'errors')}">
                                    <g:select name="player.id" from="${com.teambook.model.Player.list()}" optionKey="id" value="${affiliationInstance?.player?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gamesPlayed"><g:message code="affiliation.gamesPlayed.label" default="Games Played" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affiliationInstance, field: 'gamesPlayed', 'errors')}">
                                    <g:textField name="gamesPlayed" value="${fieldValue(bean: affiliationInstance, field: 'gamesPlayed')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
