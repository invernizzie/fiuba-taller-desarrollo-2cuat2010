<%@ page import="com.teambook.model.PlayingField" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'playingField.label', default: 'PlayingField')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/> - ${playingFieldInstance.name}</title>
</head>
<body>

<div class="body">
    <h1>${playingFieldInstance.name}</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

              <tr class="prop">
                <td colspan="2" style="text-align:center;">
                    <img width="300" height="240" src="${createLinkTo(dir: 'images/playingFields', file: playingFieldInstance.photoPath)}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="playingField.address.label" default="Address"/></td>
                <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "address")}</td>
            </tr>

            <g:if test="${playingFieldInstance.city}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="playingField.city.label" default="City"/></td>
                    <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "city")}</td>
                </tr>
            </g:if>

            <g:if test="${playingFieldInstance.state}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="playingField.state.label" default="State"/></td>
                    <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "state")}</td>
                </tr>
            </g:if>

            <g:if test="${playingFieldInstance.country}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="playingField.country.label" default="Country"/></td>
                    <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "country")}</td>
                </tr>
            </g:if>

            <g:if test="${playingFieldInstance.telephoneNumber}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="playingField.telephoneNumber.label" default="Tel"/></td>
                    <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "telephoneNumber")}</td>
                </tr>
            </g:if>

            <g:if test="${playingFieldInstance.website}">
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="playingField.website.label" default="Website"/></td>
                    <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "website")}</td>
                </tr>
            </g:if>



            </tbody>
        </table>
    </div>

</div>

</body>
</html>
