
<%@ page import="hwsp.EventoIncidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventoIncidencia.label', default: 'EventoIncidencia')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'eventoIncidencia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'eventoIncidencia.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="fechaCreacion" title="${message(code: 'eventoIncidencia.fechaCreacion.label', default: 'Fecha Creacion')}" />
                        
                            <th><g:message code="eventoIncidencia.incidencia.label" default="Incidencia" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventoIncidenciaInstanceList}" status="i" var="eventoIncidenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventoIncidenciaInstance.id}">${fieldValue(bean: eventoIncidenciaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: eventoIncidenciaInstance, field: "descripcion")}</td>
                        
                            <td><g:formatDate date="${eventoIncidenciaInstance.fechaCreacion}" /></td>
                        
                            <td>${fieldValue(bean: eventoIncidenciaInstance, field: "incidencia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventoIncidenciaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
