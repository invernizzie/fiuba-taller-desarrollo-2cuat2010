
<%@ page import="com.teambook.model.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
        	<div class="playerInfo">
		        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
		        <g:if test="${flash.message}">
		        <div class="message">${flash.message}</div>
		        </g:if>
		        <div class="dialog">
		            <table>
		                <tbody>
		                	<tr class="prop">
		                        <td valign="top" class="name"><g:message code="player.user.label" default="User" /></td>
		                        
		                         <td colspan="2" valign="top" class="value">${fieldValue(bean: playerInstance.user, field: "name")}</td>
		                        
		                    </tr>
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="player.id.label" default="Id" /></td>
		                        
		                        <td colspan="2" valign="top" class="value">${fieldValue(bean: playerInstance, field: "id")}</td>
		                        
		                    </tr>
		                    
		                      <tr class="prop">
		                        <td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playerInstance.user, field: "username")}</td>
		                        
		                    </tr>
		                    
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
		                        
		                        <td valign="top" class="value">${fieldValue(bean: playerInstance.user, field: "email")}</td>
		                        
		                    </tr>
		                    
		                      
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="user.birthday.label" default="Birthday" /></td>
		                        
		                        <td valign="top" class="value"><g:formatDate date="${playerInstance.user?.birthday}" /></td>
		                        
		                    </tr>
		                
		                
		                    <tr class="prop">
		                        <td valign="top" class="name"><g:message code="player.affiliations.label" default="Affiliations" /></td>
		                        
		                        <td colspan="2" valign="top" style="text-align: left;" class="value">
		                            <ul>
		                            <g:each in="${playerInstance.affiliations}" var="a">
		                                <li><g:link controller="affiliation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
		                            </g:each>
		                            </ul>
		                        </td>
		                        
		                    </tr>
		                  
		                    
		                     <tr class="prop">
		                        <td valign="top" class="name"><g:message code="player.averageRating.label" default="averageRatings" /></td>
		                        
		                        <td valign="top" style="text-align: left;" class="value">
		                            <ul>
		                            <g:each in="${playerInstance.getRatingsByDiscipline()}" var="r">
		                                <li>${r.key}                                     </li>
		                            </g:each>
		                            </ul>
		                        </td>
		                        
		                        <td valign="top" style="text-align: left;" class="value">
		                            <ul>
		                            <g:each in="${playerInstance.getRatingsByDiscipline()}" var="r">
		                               ${r.value}
		                            </g:each>
		                            </ul>
		                        </td>
		                        
		                    </tr>
		                
		                    
		                
		                </tbody>
		            </table>
		        </div> <!-- end dialog -->
        	</div >  <!-- end playerinfo -->

			<div class="playerPhoto">
				<g:fbPhoto facebookUID="${playerInstance.user.facebookUid}" />
			</div>
	    </div>
    </body>
</html>
