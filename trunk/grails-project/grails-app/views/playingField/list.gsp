
<%@ page import="com.teambook.model.PlayingField" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playingField.label', default: 'PlayingField')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="playingField.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'playingField.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'playingField.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'playingField.address.label', default: 'Address')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'playingField.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="state" title="${message(code: 'playingField.state.label', default: 'State')}" />
                        
                            <g:sortableColumn property="country" title="${message(code: 'playingField.country.label', default: 'Country')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playingFieldInstanceList}" status="i" var="playingFieldInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${playingFieldInstance.id}">${fieldValue(bean: playingFieldInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: playingFieldInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: playingFieldInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: playingFieldInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: playingFieldInstance, field: "state")}</td>
                        
                            <td>${fieldValue(bean: playingFieldInstance, field: "country")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${playingFieldInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
