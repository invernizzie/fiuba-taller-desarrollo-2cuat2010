
<%@ page import="com.teambook.model.PlayingField" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'playingField.label', default: 'PlayingField')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="playingField.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div class="playingFieldInfo">
		        <h1><g:message code="playingField.show.label" args="[entityName]" /></h1>
		        <g:if test="${flash.message}">
		        <div class="message">${flash.message}</div>
		        </g:if>
		        <div class="dialog">
		            <table>
		                <tbody>
		                
		              
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="playingField.name.label" default="Name" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "name")}</td>
		                        
		                    </tr>
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="playingField.address.label" default="Address" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "address")}</td>
		                        
		                    </tr>
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="playingField.city.label" default="City" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "city")}</td>
		                        
		                    </tr>
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="playingField.state.label" default="State" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "state")}</td>
		                        
		                    </tr>
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="playingField.country.label" default="Country" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playingFieldInstance, field: "country")}</td>
		                        
		                    </tr>
		                  
		                
		                </tbody>
		            </table>
		        </div>
		        <div class="buttons">
		            <g:form>
		                <g:hiddenField name="id" value="${playingFieldInstance?.id}" />
		                <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
		                <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		            </g:form>
		        </div>
	        </div> <!-- end playing field info -->

		  
	        <div class="playingFieldPhoto">
	        	<img width="300" height="240" src="${createLinkTo(dir:'images/playingFields', file:playingFieldInstance.photoPath)}" />
	        	
   		 	</div>
        </div>

    </body>
</html>
