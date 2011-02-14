

<%@ page import="com.teambook.model.Discipline" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'discipline.label', default: 'Discipline')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${disciplineInstance}">
            <div class="errors">
                <g:renderErrors bean="${disciplineInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="discipline.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplineInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${disciplineInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="playersPerTeam"><g:message code="discipline.playersPerTeam.label" default="Players Per Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disciplineInstance, field: 'playersPerTeam', 'errors')}">
                                    <g:textField name="playersPerTeam" value="${fieldValue(bean: disciplineInstance, field: 'playersPerTeam')}" />
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
