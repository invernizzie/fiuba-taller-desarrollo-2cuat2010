

<%@ page import="com.teambook.model.PlayingField" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playingField.label', default: 'PlayingField')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playingFieldInstance}">
            <div class="errors">
                <g:renderErrors bean="${playingFieldInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${playingFieldInstance?.id}" />
                <g:hiddenField name="version" value="${playingFieldInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="playingField.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playingFieldInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${playingFieldInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="playingField.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playingFieldInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${playingFieldInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="playingField.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playingFieldInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${playingFieldInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="playingField.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playingFieldInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${playingFieldInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="country"><g:message code="playingField.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playingFieldInstance, field: 'country', 'errors')}">
                                    <g:textField name="country" value="${playingFieldInstance?.country}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
