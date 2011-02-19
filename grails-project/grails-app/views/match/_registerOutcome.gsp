<%@ page import="com.teambook.model.Outcome" %>
<%
    def outcomeOptions = []
    if (matchInstance.discipline.tieable) {
        outcomeOptions.add([value: Outcome.TIE, name: message(code: 'match.tie.label')])
    }
    outcomeOptions += [
            [value: Outcome.LOCAL_WON, name: matchInstance.localTeam],
            [value: Outcome.AWAY_WON, name: matchInstance.awayTeam] ]
%>
<g:form action="registerOutcome">
<table>
    <tbody>
    <tr>
        <td colspan="2"><span class="bigHeading"><g:message code="match.registerOutcome.label"/></span></td>
    </tr>

    <tr class="prop">
        <td valign="top" class="name"><g:message code="match.winner.label"/></td>
        <td valign="top" class="value"><g:select name="outcome" from="${outcomeOptions}" optionKey="value" optionValue="name" /></td>
    </tr>
    <tr class="prop">
        <td valign="top" class="name"><g:message code="match.score.label" /></td>
        <td valign="top" class="value"><g:textField name="score"/></td>
    </tr>
    </tbody>
</table>
<div class="buttons">
    <span class="button"><g:submitButton name="registerOutcome" class="save" value="${message(code: 'match.outcome.register.label')}" /></span>
</div>
<g:hiddenField name="id" value="${matchInstance.id}" />
</g:form>