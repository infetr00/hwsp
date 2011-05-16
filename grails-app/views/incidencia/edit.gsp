

<%@ page import="hwsp.Incidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${incidenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${incidenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${incidenciaInstance?.id}" />
                <g:hiddenField name="version" value="${incidenciaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="incidencia.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textArea name="descripcion" cols="40" rows="5" value="${incidenciaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDeIncidencia"><g:message code="incidencia.tipoDeIncidencia.label" default="Tipo De Incidencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'tipoDeIncidencia', 'errors')}">
                                    <g:select name="tipoDeIncidencia" from="${incidenciaInstance.constraints.tipoDeIncidencia.inList}" value="${incidenciaInstance?.tipoDeIncidencia}" valueMessagePrefix="incidencia.tipoDeIncidencia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estadoDeIncidencia"><g:message code="incidencia.estadoDeIncidencia.label" default="Estado De Incidencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'estadoDeIncidencia', 'errors')}">
                                    <g:select name="estadoDeIncidencia" from="${incidenciaInstance.constraints.estadoDeIncidencia.inList}" value="${incidenciaInstance?.estadoDeIncidencia}" valueMessagePrefix="incidencia.estadoDeIncidencia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="importancia"><g:message code="incidencia.importancia.label" default="Importancia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'importancia', 'errors')}">
                                    <g:select name="importancia" from="${incidenciaInstance.constraints.importancia.inList}" value="${incidenciaInstance?.importancia}" valueMessagePrefix="incidencia.importancia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tecnicoAsignado"><g:message code="incidencia.tecnicoAsignado.label" default="Tecnico Asignado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'tecnicoAsignado', 'errors')}">
                                    <g:select name="tecnicoAsignado.id" from="${hwsp.User.list()}" optionKey="id" value="${incidenciaInstance?.tecnicoAsignado?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="incidencia.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${incidenciaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="eventos"><g:message code="incidencia.eventos.label" default="Eventos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'eventos', 'errors')}">
                                    
<ul>
<g:each in="${incidenciaInstance?.eventos?}" var="e">
    <li><g:link controller="eventoIncidencia" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="eventoIncidencia" action="create" params="['incidencia.id': incidenciaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaCreacion"><g:message code="incidencia.fechaCreacion.label" default="Fecha Creacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'fechaCreacion', 'errors')}">
                                    <g:datePicker name="fechaCreacion" precision="day" value="${incidenciaInstance?.fechaCreacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaModificacion"><g:message code="incidencia.fechaModificacion.label" default="Fecha Modificacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'fechaModificacion', 'errors')}">
                                    <g:datePicker name="fechaModificacion" precision="day" value="${incidenciaInstance?.fechaModificacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="informacionEspecifica"><g:message code="incidencia.informacionEspecifica.label" default="Informacion Especifica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'informacionEspecifica', 'errors')}">
                                    <g:textField name="informacionEspecifica" value="${incidenciaInstance?.informacionEspecifica}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="producto"><g:message code="incidencia.producto.label" default="Producto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'producto', 'errors')}">
                                    <g:textField name="producto" value="${incidenciaInstance?.producto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="incidencia.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${incidenciaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="incidencia.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${hwsp.User.list()}" optionKey="id" value="${incidenciaInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="versionInstalada"><g:message code="incidencia.versionInstalada.label" default="Version Instalada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'versionInstalada', 'errors')}">
                                    <g:textField name="versionInstalada" value="${incidenciaInstance?.versionInstalada}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
