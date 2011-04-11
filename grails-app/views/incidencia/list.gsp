
<%@ page import="hwsp.Incidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'incidencia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="tipoDeIncidencia" title="${message(code: 'incidencia.tipoDeIncidencia.label', default: 'Tipo De Incidencia')}" />
                        
                            <g:sortableColumn property="estadoDeIncidencia" title="${message(code: 'incidencia.estadoDeIncidencia.label', default: 'Estado De Incidencia')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'incidencia.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'incidencia.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'incidencia.fecha.label', default: 'Fecha')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${incidenciaInstanceList}" status="i" var="incidenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${incidenciaInstance.id}">${fieldValue(bean: incidenciaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: incidenciaInstance, field: "tipoDeIncidencia")}</td>
                        
                            <td>${fieldValue(bean: incidenciaInstance, field: "estadoDeIncidencia")}</td>
                        
                            <td>${fieldValue(bean: incidenciaInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: incidenciaInstance, field: "email")}</td>
                        
                            <td><g:formatDate date="${incidenciaInstance.fecha}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${incidenciaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
