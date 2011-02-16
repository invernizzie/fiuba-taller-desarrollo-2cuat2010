<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Teambook" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="prototype" />
    </head>
    <body>
        <div class="content">
            <div class="header">
                <div id="spinner" class="spinner" style="display:none;">
                    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                </div>
                <div class="layoutHeader">
                    <g:link uri="/"><g:message code="header.home" /></g:link>
                </div>
                <div class="headerSearch">
                    <g:form controller="match" action="list">
                        <g:textField name="matchName" value="${message(code: 'header.search.label')}" onfocus="replaceQuery(this)" />
                    </g:form>
                </div>
            </div>
            <g:layoutBody />
            <g:render template="/layouts/footer" />
        </div>
    </body>
</html>
