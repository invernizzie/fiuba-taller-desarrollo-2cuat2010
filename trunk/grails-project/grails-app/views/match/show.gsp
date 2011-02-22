<%@ page import="com.teambook.model.Match" %>
<%@ page import="com.teambook.model.Outcome" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:message code="match.label"/>: ${matchInstance.name} - Teambook</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="match.list.label" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="match.organize.label" /></g:link></span>
        </div>
        <div class="body">
            <h1>${matchInstance.name}</h1>
            <div class="message" ${(!flash.message) ? 'style="display: none;"' : ''} id="message">${flash.message}</div>
            <g:hasErrors bean="${matchInstance}">
                <div class="errors">
                    <g:renderErrors bean="${matchInstance}" as="list" />
                </div>
            </g:hasErrors>
            <div class="dialog" style="position: relative;">
            <g:if test="${(matchInstance.owner.id == session.user.id) && matchInstance.scoreToBeRegistered}">
                <g:render template="registerOutcome" model="[matchInstance: matchInstance]" />
            </g:if>
                <table>
                    <tbody>
                    <g:if test="${matchInstance.outcome}">
                        <div class="matchOutcome">
                            <g:if test="${matchInstance.winner}">
                                ${matchInstance.winner} <g:message code="match.won.label"/>
                            </g:if>
                            <g:else>
                                <g:message code="match.tie.label"/>
                            </g:else>
                            <br />
                            <span class="score">${matchInstance.score}</span>
                        </div>
                    </g:if>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.owner.label" default="Owner" /></td>
                        <td valign="top" class="value" colspan="3"><g:link controller="user" action="show" id="${matchInstance?.owner?.id}">${matchInstance?.owner?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.publicMatch.label" default="Public Match" /></td>
                        <td valign="top" class="value" colspan="3"><g:formatBoolean boolean="${matchInstance?.publicMatch}" true="${message(code: 'yes')}" false="${message(code: 'no')}"/></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.discipline.label" default="Discipline" /></td>
                        <td valign="top" class="value" colspan="3"><g:link controller="discipline" action="show" id="${matchInstance?.discipline?.id}">${matchInstance?.discipline?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.startingTime.label" default="Starting Time" /></td>
                        <td valign="top" class="value" colspan="3"><g:formatDate date="${matchInstance?.startingTime}" /></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.endingTime.label" default="Ending Time" /></td>
                        <td valign="top" class="value" colspan="3"><g:formatDate date="${matchInstance?.endingTime}" /></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.field.label" default="Field" /></td>
                        <td valign="top" class="value" colspan="3"><g:link controller="playingField" action="show" id="${matchInstance?.field?.id}">${matchInstance?.field?.encodeAsHTML()}</g:link></td>
                    </tr>
                    <%--
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.localTeam.label" default="Local Team" /></td>
                        <td valign="top" class="value"><g:link controller="team" action="show" id="${matchInstance?.localTeam?.id}">${matchInstance?.localTeam?.encodeAsHTML()}</g:link></td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="match.awayTeam.label" default="Away Team" /></td>
                        <td valign="top" class="value"><g:link controller="team" action="show" id="${matchInstance?.awayTeam?.id}">${matchInstance?.awayTeam?.encodeAsHTML()}</g:link></td>
                    </tr>
                    --%>
                    </tbody>
                </table>
            </div>
            <div class="teamLists">
                <div id="teamList${matchInstance.localTeam.id}" class="inlineDiv">
                    <g:render template="teamList" model="[team: matchInstance.localTeam]" />
                </div>
                <div id="teamList${matchInstance.awayTeam.id}" class="inlineDiv">
                    <g:render template="teamList" model="[team: matchInstance.awayTeam]" />
                </div>
            </div>
            <g:if test="${(matchInstance.owner.id == session.user.id) && matchInstance.scoreToBeRegistered}">
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${matchInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            </g:if>
        </div>
    </body>
</html>
