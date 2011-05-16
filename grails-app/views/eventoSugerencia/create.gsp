

<%@ page import="hwsp.EventoSugerencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'eventoSugerencia.label', default: 'EventoSugerencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventoSugerenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventoSugerenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="eventoSugerencia.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoSugerenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea name="descripcion" cols="40" rows="5" value="${eventoSugerenciaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaCreacion"><g:message code="eventoSugerencia.fechaCreacion.label" default="Fecha Creacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoSugerenciaInstance, field: 'fechaCreacion', 'errors')}">
                                    <g:datePicker name="fechaCreacion" precision="day" value="${eventoSugerenciaInstance?.fechaCreacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sugerencia"><g:message code="eventoSugerencia.sugerencia.label" default="Sugerencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoSugerenciaInstance, field: 'sugerencia', 'errors')}">
                                    <g:select name="sugerencia.id" from="${hwsp.Sugerencia.list()}" optionKey="id" value="${eventoSugerenciaInstance?.sugerencia?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
