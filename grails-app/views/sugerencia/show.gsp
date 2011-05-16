
<%@ page import="hwsp.Sugerencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sugerencia.label', default: 'Sugerencia')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.tipoDeSugerencia.label" default="Tipo De Sugerencia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "tipoDeSugerencia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.estadoDeSugerencia.label" default="Estado De Sugerencia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "estadoDeSugerencia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.prioridad.label" default="Prioridad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "prioridad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.eventos.label" default="Eventos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${sugerenciaInstance.eventos}" var="e">
                                    <li><g:link controller="eventoSugerencia" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.fechaCreacion.label" default="Fecha Creacion" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sugerenciaInstance?.fechaCreacion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.fechaModificacion.label" default="Fecha Modificacion" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sugerenciaInstance?.fechaModificacion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.informacionEspecifica.label" default="Informacion Especifica" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "informacionEspecifica")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.producto.label" default="Producto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "producto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${sugerenciaInstance?.user?.id}">${sugerenciaInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sugerencia.versionInstalada.label" default="Version Instalada" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sugerenciaInstance, field: "versionInstalada")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${sugerenciaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
