
<%@ page import="com.teambook.model.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:message code="match.list.label" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="match.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <%-- Opciones de filtrado --%>
            <g:form action="list" id="filterForm">
            <div class="dialog">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="matchName"><g:message code="match.name.label" /></label>
                        </td>
                        <td valign="top" colspan="3">
                            <g:textField name="matchName" value="${matchName ?: ''}" size="60"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="disciplineId"><g:message code="match.discipline.label" /></label>
                        </td>
                        <td valign="top">
                            <g:select name="disciplineId" from="${com.teambook.model.Discipline.list()}" optionKey="id" value="${disciplineId ?: 0}" noSelection="['null':message(code: 'match.list.filter.any.label')]" />
                        </td>

                        <td valign="top" class="name">
                            <label for="matchOwner"><g:message code="match.owner.label" /></label>
                        </td>
                        <td valign="top">
                            <g:textField name="matchOwner" value="${matchOwner ?: ''}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="localTeam"><g:message code="match.localTeam.label" /></label>
                        </td>
                        <td valign="top">
                            <g:textField name="localTeam" value="${localTeam ?: ''}" />
                        </td>

                        <td valign="top" class="name">
                            <label for="awayTeam"><g:message code="match.awayTeam.label" /></label>
                        </td>
                        <td valign="top">
                            <g:textField name="awayTeam" value="${awayTeam ?: ''}" />
                        </td>
                    </tr>

                    <%--
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="publicMatch"><g:message code="match.publicMatch.label" /></label>
                        </td>
                        <td valign="top">
                            <g:checkBox name="publicMatch" value="${publicMatch ?: true}" />
                        </td>

                        <td valign="top" class="name">
                            <label for="status"><g:message code="match.list.filter.status" /></label>
                        </td>
                        <td valign="top">
                            <g:select name="status" optionKey="value" optionValue="name" from="${[
                                    [name: message(code: 'match.list.filter.status.all'), value: 'all'],
                                    [name: message(code: 'match.list.filter.status.played'), value: 'played'],
                                    [name: message(code: 'match.list.filter.status.unplayed'), value: 'unplayed'] ]}" />
                        </td>
                    </tr>
                    --%>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="minDate"><g:message code="match.list.filter.minDate" /></label>
                        </td>
                        <td valign="top">
                            <g:datePicker name="minDate" precision="day" value="${minDate ?: ''}" default="none" noSelection="['':'']" />
                        </td>

                        <td valign="top" class="name">
                            <label for="maxDate"><g:message code="match.list.filter.maxDate" /></label>
                        </td>
                        <td valign="top">
                            <g:datePicker name="maxDate" precision="day" value="${maxDate ?: ''}" default="none" noSelection="['':'']" />
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="buttons">
                    <span class="button"><g:submitButton name="submit" class="filter" value="${message(code: 'match.list.filter.label')}" /></span>
                </div>
            </div>
            </g:form>
            <br />
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th><g:message code="match.name.label" /></th>

                            <g:sortableColumn property="discipline.name" title="${message(code: 'match.discipline.label', default: 'Discipline')}" />

                            <g:sortableColumn property="startingTime" title="${message(code: 'match.startingTime.label', default: 'Starting Time')}" />

                            <g:sortableColumn property="endingTime" title="${message(code: 'match.endingTime.label', default: 'Ending Time')}" />

                            <g:sortableColumn property="field.name" title="${message(code: 'match.field.label', default: 'Field')}" />

                            <g:sortableColumn property="localTeam.name" title="${message(code: 'match.localTeam.label', default: 'Local Team')}" />

                            <g:sortableColumn property="awayTeam.name" title="${message(code: 'match.awayTeam.label', default: 'Away Team')}" />

                            <g:sortableColumn property="publicMatch" title="${message(code: 'match.publicMatch.label')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${matchInstanceList}" status="i" var="matchInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${matchInstance.id}">${matchInstance?.name}</g:link></td>

                            <td>${matchInstance?.discipline}</td>

                            <td><g:formatDate date="${matchInstance.startingTime}" /></td>

                            <td><g:formatDate date="${matchInstance.endingTime}" /></td>

                            <td>${matchInstance?.field}</td>

                            <td>${matchInstance?.localTeam}</td>
                        
                            <td>${matchInstance?.awayTeam}</td>

                            <td><g:formatBoolean boolean="${matchInstance?.publicMatch}" true="${message(code: 'yes')}" false="${message(code: 'no')}"/></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${matchInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
