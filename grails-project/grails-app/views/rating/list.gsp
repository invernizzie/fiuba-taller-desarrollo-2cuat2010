
<%@ page import="com.teambook.model.Rating" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rating.label', default: 'Rating')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'rating.id.label', default: 'Id')}" />
                        
                            <th><g:message code="rating.discipline.label" default="Discipline" /></th>
                        
                            <th><g:message code="rating.player.label" default="Player" /></th>
                        
                            <g:sortableColumn property="rating" title="${message(code: 'rating.rating.label', default: 'Rating')}" />
                        
                            <th><g:message code="rating.user.label" default="User" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingInstanceList}" status="i" var="ratingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ratingInstance.id}">${fieldValue(bean: ratingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ratingInstance, field: "discipline")}</td>
                        
                            <td>${fieldValue(bean: ratingInstance, field: "player")}</td>
                        
                            <td>${fieldValue(bean: ratingInstance, field: "rating")}</td>
                        
                            <td>${fieldValue(bean: ratingInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ratingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
