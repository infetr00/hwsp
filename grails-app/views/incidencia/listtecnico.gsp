<%@ page import="hwsp.Incidencia" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}"/>
  <title>Lista de Incidencias</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Inicio</a></span>
  <span class="menuButton"><g:link class="list" controller="incidencia" action="listtecnico">Lista de Incidencias</g:link></span>
  %{--<span class="menuButton"><g:link class="list" controller="sugerencia" action="listtecnico">Lista de Sugerencias</g:link></span>--}%
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span>

</div>
<div class="body">
  <h1>Lista de Incidencias</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'incidencia.id.label', default: 'Id')}"/>

        <g:sortableColumn property="descripcion" title="${message(code: 'incidencia.descripcion.label', default: 'Descripcion')}"/>

        <g:sortableColumn property="tipoDeIncidencia" title="${message(code: 'incidencia.tipoDeIncidencia.label', default: 'Tipo De Incidencia')}"/>

        <g:sortableColumn property="estadoDeIncidencia" title="${message(code: 'incidencia.estadoDeIncidencia.label', default: 'Estado De Incidencia')}"/>

        <g:sortableColumn property="importancia" title="${message(code: 'incidencia.importancia.label', default: 'Importancia')}"/>

        <th><g:message code="incidencia.tecnicoAsignado.label" default="Tecnico Asignado"/></th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${incidenciaInstanceList}" status="i" var="incidenciaInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="showadvancedtecnico" id="${incidenciaInstance.id}">${fieldValue(bean: incidenciaInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: incidenciaInstance, field: "descripcion")}</td>

          <td>${fieldValue(bean: incidenciaInstance, field: "tipoDeIncidencia")}</td>

          <td>${fieldValue(bean: incidenciaInstance, field: "estadoDeIncidencia")}</td>

          <td>${fieldValue(bean: incidenciaInstance, field: "importancia")}</td>

          <td>${incidenciaInstance.tecnicoAsignado.nombre}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  %{--<div class="paginateButtons">--}%
    %{--<g:paginate total="${incidenciaInstanceTotal}"/>--}%
  %{--</div>--}%
</div>
</body>
</html>
