
<%@ page import="hwsp.EventoSugerencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventoSugerencia.label', default: 'EventoSugerencia')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'eventoSugerencia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'eventoSugerencia.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="fechaCreacion" title="${message(code: 'eventoSugerencia.fechaCreacion.label', default: 'Fecha Creacion')}" />
                        
                            <th><g:message code="eventoSugerencia.sugerencia.label" default="Sugerencia" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventoSugerenciaInstanceList}" status="i" var="eventoSugerenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventoSugerenciaInstance.id}">${fieldValue(bean: eventoSugerenciaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: eventoSugerenciaInstance, field: "descripcion")}</td>
                        
                            <td><g:formatDate date="${eventoSugerenciaInstance.fechaCreacion}" /></td>
                        
                            <td>${fieldValue(bean: eventoSugerenciaInstance, field: "sugerencia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventoSugerenciaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
