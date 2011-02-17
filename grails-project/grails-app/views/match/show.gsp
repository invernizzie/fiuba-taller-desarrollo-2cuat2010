
<%@ page import="com.teambook.model.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:render template="matchName" model="[match: matchInstance]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="match.list.label" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="match.organize.label" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:render template="matchName" model="[match: matchInstance]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.owner.label" default="Owner" /></td>
                        <td valign="top" class="value"><g:link controller="user" action="show" id="${matchInstance?.owner?.id}">${matchInstance?.owner?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.publicMatch.label" default="Public Match" /></td>
                        <td valign="top" class="value"><g:formatBoolean boolean="${matchInstance?.publicMatch}" true="${message(code: 'yes')}" false="${message(code: 'no')}"/></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.discipline.label" default="Discipline" /></td>
                        <td valign="top" class="value"><g:link controller="discipline" action="show" id="${matchInstance?.discipline?.id}">${matchInstance?.discipline?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.startingTime.label" default="Starting Time" /></td>
                        <td valign="top" class="value"><g:formatDate date="${matchInstance?.startingTime}" /></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.endingTime.label" default="Ending Time" /></td>
                        <td valign="top" class="value"><g:formatDate date="${matchInstance?.endingTime}" /></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.field.label" default="Field" /></td>
                        <td valign="top" class="value"><g:link controller="playingField" action="show" id="${matchInstance?.field?.id}">${matchInstance?.field?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.localTeam.label" default="Local Team" /></td>
                        <td valign="top" class="value"><g:link controller="team" action="show" id="${matchInstance?.localTeam?.id}">${matchInstance?.localTeam?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.awayTeam.label" default="Away Team" /></td>
                        <td valign="top" class="value"><g:link controller="team" action="show" id="${matchInstance?.awayTeam?.id}">${matchInstance?.awayTeam?.encodeAsHTML()}</g:link></td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${matchInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>