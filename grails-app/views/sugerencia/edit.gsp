

<%@ page import="hwsp.Sugerencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sugerencia.label', default: 'Sugerencia')}" />
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
            <g:hasErrors bean="${sugerenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${sugerenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sugerenciaInstance?.id}" />
                <g:hiddenField name="version" value="${sugerenciaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDeSugerencia"><g:message code="sugerencia.tipoDeSugerencia.label" default="Tipo De Sugerencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'tipoDeSugerencia', 'errors')}">
                                    <g:select name="tipoDeSugerencia" from="${sugerenciaInstance.constraints.tipoDeSugerencia.inList}" value="${sugerenciaInstance?.tipoDeSugerencia}" valueMessagePrefix="sugerencia.tipoDeSugerencia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estadoDeSugerencia"><g:message code="sugerencia.estadoDeSugerencia.label" default="Estado De Sugerencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'estadoDeSugerencia', 'errors')}">
                                    <g:select name="estadoDeSugerencia" from="${sugerenciaInstance.constraints.estadoDeSugerencia.inList}" value="${sugerenciaInstance?.estadoDeSugerencia}" valueMessagePrefix="sugerencia.estadoDeSugerencia"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="sugerencia.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${sugerenciaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="sugerencia.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${sugerenciaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="sugerencia.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${sugerenciaInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="informacionEspecifica"><g:message code="sugerencia.informacionEspecifica.label" default="Informacion Especifica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'informacionEspecifica', 'errors')}">
                                    <g:textField name="informacionEspecifica" value="${sugerenciaInstance?.informacionEspecifica}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombreDeReportador"><g:message code="sugerencia.nombreDeReportador.label" default="Nombre De Reportador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'nombreDeReportador', 'errors')}">
                                    <g:textField name="nombreDeReportador" value="${sugerenciaInstance?.nombreDeReportador}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="producto"><g:message code="sugerencia.producto.label" default="Producto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'producto', 'errors')}">
                                    <g:textField name="producto" value="${sugerenciaInstance?.producto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="sugerencia.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${sugerenciaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="versionInstalada"><g:message code="sugerencia.versionInstalada.label" default="Version Instalada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sugerenciaInstance, field: 'versionInstalada', 'errors')}">
                                    <g:textField name="versionInstalada" value="${sugerenciaInstance?.versionInstalada}" />
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
