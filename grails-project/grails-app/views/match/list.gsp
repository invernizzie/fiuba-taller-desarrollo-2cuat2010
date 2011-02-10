
<%@ page import="com.teambook.model.Match" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
        <title><g:message code="match.list.public.label" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="match.organize.label" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="match.list.public.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
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

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${matchInstanceList}" status="i" var="matchInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${matchInstance.id}">
                                ${matchInstance?.localTeam} <g:message code="match.name.vs" /> ${matchInstance?.awayTeam}
                            </g:link></td>

                            <td>${matchInstance?.discipline}</td>

                            <td><g:formatDate date="${matchInstance.startingTime}" /></td>

                            <td><g:formatDate date="${matchInstance.endingTime}" /></td>

                            <td>${matchInstance?.field}</td>

                            <td>${matchInstance?.localTeam}</td>
                        
                            <td>${matchInstance?.awayTeam}</td>
                        
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
