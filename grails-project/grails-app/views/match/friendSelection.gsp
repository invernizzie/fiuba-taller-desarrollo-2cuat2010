<%-- por que no hice un template?? --%>
<%@ page import="grails.converters.JSON" %>
<html>
<body>
<div>
    <g:each in="${friends}" var="friend" status="index">
        <div class="fbFriend" onclick='friendChooser.toggle(this, ${friend as JSON});'>
            <div class="fbPic"><f:pic id="${friend.id}" /></div>
            <div class="friendData">${friend.name}</div>
        </div>
    </g:each>
</div>
</body>
</html>