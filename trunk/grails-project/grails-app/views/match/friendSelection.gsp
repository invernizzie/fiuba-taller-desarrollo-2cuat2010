<html>
<g:each in="${friends}" var="friend" status="index">
    <div class="fbpic"><f:pic id="${friend.id}" /></div>
    ${friend.name}
</g:each>
</html>