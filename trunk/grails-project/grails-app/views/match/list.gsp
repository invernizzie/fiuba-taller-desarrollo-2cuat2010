
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
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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

                            <th><g:message code="match.discipline.label" default="Discipline" /></th>

                            <g:sortableColumn property="startingTime" title="${message(code: 'match.startingTime.label', default: 'Starting Time')}" />

                            <g:sortableColumn property="endingTime" title="${message(code: 'match.endingTime.label', default: 'Ending Time')}" />

                            <th><g:message code="match.localTeam.label" default="Local Team" /></th>                            

                            <th><g:message code="match.awayTeam.label" default="Away Team" /></th>
                        
                            <th><g:message code="match.field.label" default="Field" /></th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${matchInstanceList}" status="i" var="matchInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${matchInstance.id}">
                                ${matchInstance.localTeam.name} <g:message code="match.name.vs" /> ${matchInstance.awayTeam.name}
                            </g:link></td>

                            <td><g:formatDate date="${matchInstance.startingTime}" /></td>

                            <td><g:formatDate date="${matchInstance.endingTime}" /></td>

                            <td>${fieldValue(bean: matchInstance.field, field: "name")}</td>

                            <td>${fieldValue(bean: matchInstance.localTeam, field: "name")}</td>
                        
                            <td>${fieldValue(bean: matchInstance.awayTeam, field: "name")}</td>
                        
                            <td>${fieldValue(bean: matchInstance.discipline, field: "name")}</td>
                        
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
