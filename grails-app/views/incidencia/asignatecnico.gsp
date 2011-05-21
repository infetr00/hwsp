<%@ page import="hwsp.Role; hwsp.Incidencia" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}"/>
  <title>Asigna tecnico</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Inicio</a></span>
  <span class="menuButton"><g:link class="list" action="listcoordinador">Lista de Incidencias sin asignar</g:link></span>
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span></div>
  %{--<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>--}%
  %{--<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>--}%
</div>
<div class="body">
  <h1>Asignar tecnico e importancia</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${incidenciaInstance}">
    <div class="errors">
      <g:renderErrors bean="${incidenciaInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${incidenciaInstance?.id}"/>
    <g:hiddenField name="version" value="${incidenciaInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.descripcion.label" default="Descripcion"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "descripcion")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.tipoDeIncidencia.label" default="Tipo De Incidencia"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "tipoDeIncidencia")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.estadoDeIncidencia.label" default="Estado De Incidencia"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "estadoDeIncidencia")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="importancia"><g:message code="incidencia.importancia.label" default="Importancia"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'importancia', 'errors')}">
            <g:select name="importancia" from="${incidenciaInstance.constraints.importancia.inList}" value="${incidenciaInstance?.importancia}" valueMessagePrefix="incidencia.importancia"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="tecnicoAsignado"><g:message code="incidencia.tecnicoAsignado.label" default="Tecnico Asignado"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'tecnicoAsignado', 'errors')}">
            <g:select name="tecnicoAsignado.id" from="${tecnicosList}" optionValue="email" optionKey="id" value="${incidenciaInstance?.tecnicoAsignado?.id}" noSelection="['null': '']"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.informacionEspecifica.label" default="Informacion Especifica"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "informacionEspecifica")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.producto.label" default="Producto"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "producto")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.versionInstalada.label" default="Version Instalada"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "versionInstalada")}</td>

        </tr>


        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.fechaCreacion.label" default="Fecha Creacion"/></td>

          <td valign="top" class="value"><g:formatDate date="${incidenciaInstance?.fechaCreacion}"/></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.fechaModificacion.label" default="Fecha Modificacion"/></td>

          <td valign="top" class="value"><g:formatDate date="${incidenciaInstance?.fechaModificacion}"/></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.user.label" default="Usuario Reportador"/></td>

          <td valign="top" class="value">${incidenciaInstance.user.nombre.encodeAsHTML()}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.email.label" default="Email"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "email")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="incidencia.telefono.label" default="Telefono"/></td>

          <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "telefono")}</td>

        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="updateasigatecnico" value="Actualizar"/></span>
      %{--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%
    </div>
  </g:form>
</div>
</body>
</html>
