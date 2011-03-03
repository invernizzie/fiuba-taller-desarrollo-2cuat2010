<%@ page import="com.teambook.model.Discipline" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Rankings - Teambook</title>
</head>
<body>
<div class="body">
    <h1>${discipline.name}</h1>
    <ol>
    <g:each in="${players}" >
        <li style="width: 300px; position: relative;">
            ${it.user.name}
            <g:set var="rating" value="${it.getRatingForDiscipline(discipline)}" />
            <div style="display: inline-block; position: absolute; right: 0;">
                <g:each in="${1..5}" >
                    <g:set var="i" value="${it}" />
                        <img src="${resource(dir: 'images', file: 'star_icon' + (i > (rating / 2) ? '_gray' : '') + '.png')}" alt="${i > rating / 2 ? '' : '*'}" />
                </g:each>
            </div>
        </li>
    </g:each>
    </ol>
</div>
</body>
</html>