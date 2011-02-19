

<%@ page import="com.teambook.model.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="match.list.label" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${matchInstance}">
            <div class="errors">
                <g:renderErrors bean="${matchInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="match.name.label" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'name', 'errors')}">
                                <g:textField name="name" value="${matchInstance?.name}" size="60" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="discipline.id"><g:message code="match.discipline.label" default="Discipline" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'discipline', 'errors')}">
                                <g:select name="discipline.id" from="${com.teambook.model.Discipline.list()}" optionKey="id" value="${matchInstance?.discipline?.id}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="startingTime"><g:message code="match.startingTime.label" default="Starting Time" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'startingTime', 'errors')}">
                                <g:datePicker name="startingTime" precision="minute" value="${matchInstance?.startingTime}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="endingTime"><g:message code="match.endingTime.label" default="Ending Time" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'endingTime', 'errors')}">
                                <g:datePicker name="endingTime" precision="minute" value="${matchInstance?.endingTime}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="field.id"><g:message code="match.field.label" default="Field" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'field', 'errors')}">
                                <g:select name="field.id" from="${com.teambook.model.PlayingField.list()}" optionKey="id" value="${matchInstance?.field?.id}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="localTeam.id"><g:message code="match.localTeam.label" default="Local Team" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'localTeam', 'errors')}">
                                <g:select name="localTeam.id" from="${com.teambook.model.Team.list()}" optionKey="id" value="${matchInstance?.localTeam?.id}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="awayTeam.id"><g:message code="match.awayTeam.label" default="Away Team" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'awayTeam', 'errors')}">
                                <g:select name="awayTeam.id" from="${com.teambook.model.Team.list()}" optionKey="id" value="${matchInstance?.awayTeam?.id}"  />
                            </td>
                        </tr>

                        <%--
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="owner.id"><g:message code="match.owner.label" default="Owner" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'owner', 'errors')}">
                                <g:select name="owner.id" from="${com.teambook.model.User.list()}" optionKey="id" value="${matchInstance?.owner?.id}"  />
                                <br/><span style="color: red">Debería setearlo el controller al usuario actual, pero todavía no hay autenticación</span>
                            </td>
                        </tr>
                        --%>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="publicMatch"><g:message code="match.publicMatch.label" default="Public Match" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: matchInstance, field: 'publicMatch', 'errors')}">
                                <g:checkBox name="publicMatch" value="${matchInstance?.publicMatch}" />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
