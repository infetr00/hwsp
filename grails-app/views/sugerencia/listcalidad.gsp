<%@ page import="hwsp.Sugerencia" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'sugerencia.label', default: 'Sugerencia')}"/>
  <title>Lista de Sugerencias</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Inicio</a></span>
  <span class="menuButton"><g:link class="list" controller="incidencia" action="listcalidad">Lista de Incidencias</g:link></span>
  <span class="menuButton"><g:link class="list" controller="sugerencia" action="listcalidad">Lista de Sugerencias</g:link></span>
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span></div>
<div class="body">
  <h1>Lista de sugerencias</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'sugerencia.id.label', default: 'Id')}"/>

        <g:sortableColumn property="descripcion" title="${message(code: 'sugerencia.descripcion.label', default: 'Descripcion')}"/>

        <g:sortableColumn property="tipoDeSugerencia" title="${message(code: 'sugerencia.tipoDeSugerencia.label', default: 'Tipo De Sugerencia')}"/>

        <g:sortableColumn property="estadoDeSugerencia" title="${message(code: 'sugerencia.estadoDeSugerencia.label', default: 'Estado De Sugerencia')}"/>

        <g:sortableColumn property="prioridad" title="${message(code: 'sugerencia.prioridad.label', default: 'Prioridad')}"/>

        <g:sortableColumn property="email" title="${message(code: 'sugerencia.email.label', default: 'Email')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${sugerenciaInstanceList}" status="i" var="sugerenciaInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="showadvancedtecnico" id="${sugerenciaInstance.id}">${fieldValue(bean: sugerenciaInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: sugerenciaInstance, field: "descripcion")}</td>

          <td>${fieldValue(bean: sugerenciaInstance, field: "tipoDeSugerencia")}</td>

          <td>${fieldValue(bean: sugerenciaInstance, field: "estadoDeSugerencia")}</td>

          <td>${fieldValue(bean: sugerenciaInstance, field: "prioridad")}</td>

          <td>${fieldValue(bean: sugerenciaInstance, field: "email")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  %{--<div class="paginateButtons">--}%
  %{--<g:paginate total="${sugerenciaInstanceTotal}" />--}%
  %{--</div>--}%
</div>
</body>
</html>
