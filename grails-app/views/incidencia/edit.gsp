

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
                                  <label for="descripcion"><g:message code="incidencia.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${incidenciaInstance?.descripcion}" />
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
                                  <label for="fecha"><g:message code="incidencia.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${incidenciaInstance?.fecha}"  />
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
                                  <label for="nombreDeReportador"><g:message code="incidencia.nombreDeReportador.label" default="Nombre De Reportador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'nombreDeReportador', 'errors')}">
                                    <g:textField name="nombreDeReportador" value="${incidenciaInstance?.nombreDeReportador}" />
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