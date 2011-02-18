
<%@ page import="com.teambook.model.Affiliation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'affiliation.label', default: 'Affiliation')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'affiliation.id.label', default: 'Id')}" />
                        
                            <th><g:message code="affiliation.team.label" default="Team" /></th>
                        
                            <th><g:message code="affiliation.player.label" default="Player" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'affiliation.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="gamesPlayed" title="${message(code: 'affiliation.gamesPlayed.label', default: 'Games Played')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${affiliationInstanceList}" status="i" var="affiliationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${affiliationInstance.id}">${fieldValue(bean: affiliationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: affiliationInstance, field: "team")}</td>
                        
                            <td>${fieldValue(bean: affiliationInstance, field: "player")}</td>
                        
                            <td><g:formatDate date="${affiliationInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: affiliationInstance, field: "gamesPlayed")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${affiliationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
