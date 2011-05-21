<%@ page import="hwsp.Incidencia" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}"/>
  <title>Informacion de la incidencia</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Inicio</a></span>
  <span class="menuButton"><g:link class="list" action="listcoordinador">Lista de Incidencias sin asignar</g:link></span>
  %{--<span class="menuButton"><g:link class="list" action="list">Lista de Incidencias</g:link></span>--}%
  %{--<span class="menuButton"><g:link class="list" controller="sugerencia" action="list">Lista de Sugerencias</g:link></span>--}%
  %{--<span class="menuButton"><g:link class="create" action="create">Reportar Incidencia</g:link></span>--}%
  %{--<span class="menuButton"><g:link class="create" controller="sugerencia" action="create">Reportar Sugerencia</g:link></span>--}%
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span>

</div>
<div class="body">
  <h1>Informacion de la Incidencia</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="incidencia.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "id")}</td>

      </tr>

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
        <td valign="top" class="name"><g:message code="incidencia.importancia.label" default="Importancia"/></td>

        <td valign="top" class="value">${fieldValue(bean: incidenciaInstance, field: "importancia")}</td>

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


      <tr class="prop">
        <td valign="top" class="name"><g:message code="incidencia.tecnicoAsignado.label" default="Tecnico Asignado"/></td>

        <td valign="top" class="value">${incidenciaInstance?.tecnicoAsignado?.nombre?.encodeAsHTML()}</td>

      </tr>

      %{--<tr class="prop">--}%
      %{--<td valign="top" class="name"><g:message code="incidencia.eventos.label" default="Eventos"/></td>--}%

      %{--<td valign="top" style="text-align: left;" class="value">--}%
      %{--<ul>--}%
      %{--<g:each in="${incidenciaInstance.eventos}" var="e">--}%
      %{--<li><g:link controller="eventoIncidencia" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>--}%
      %{--</g:each>--}%
      %{--</ul>--}%
      %{--</td>--}%

      %{--</tr>--}%

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${incidenciaInstance?.id}"/>
    %{--<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>--}%
    %{--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%
      <span class="button"><g:actionSubmit class="edit" action="addevento" value="Añadir evento"/></span>

    %{--<span class="button"><g:actionSubmit class="edit" action="addeventoycierra" value="Cerrar Incidencia"/></span--}%
    </g:form>
  </div>
</div>

<div class="body">
  <h1>Historico de Eventos de la Incidencia</h1>

  <div class="list">
    <table>
      <thead>
      <tr>

        %{--<g:sortableColumn property="id" title="${message(code: 'eventoIncidencia.id.label', default: 'Id')}"/>--}%

        <g:sortableColumn property="descripcion" title="${message(code: 'eventoIncidencia.descripcion.label', default: 'Descripcion')}"/>

        <g:sortableColumn property="fechaCreacion" title="Fecha"/>
        <g:sortableColumn property="user" title="${message(code: 'eventoIncidencia.user.label', default: 'Usuario')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${eventoIncidenciaInstanceList}" status="i" var="eventoIncidenciaInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          %{--<td><g:link action="show" id="${eventoIncidenciaInstance.id}">${fieldValue(bean: eventoIncidenciaInstance, field: "id")}</g:link></td>--}%

          <td>${fieldValue(bean: eventoIncidenciaInstance, field: "descripcion")}</td>

          <td><g:formatDate date="${eventoIncidenciaInstance.fechaCreacion}"/></td>

          <td>${fieldValue(bean: eventoIncidenciaInstance, field: "user.nombre")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>

</body>
</html>
