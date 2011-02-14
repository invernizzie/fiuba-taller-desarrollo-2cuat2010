
<%@ page import="com.teambook.model.Discipline" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'discipline.label', default: 'Discipline')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="discipline.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'discipline.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'discipline.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="playersPerTeam" title="${message(code: 'discipline.playersPerTeam.label', default: 'Players Per Team')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${disciplineInstanceList}" status="i" var="disciplineInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${disciplineInstance.id}">${fieldValue(bean: disciplineInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: disciplineInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: disciplineInstance, field: "playersPerTeam")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${disciplineInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
