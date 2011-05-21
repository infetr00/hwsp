<%@ page import="hwsp.EventoIncidencia" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'eventoIncidencia.label', default: 'EventoIncidencia')}"/>
  <title>Crear evento de Incidencia</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Inicio</a></span>
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span>
  %{--<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>--}%
</div>
<div class="body">
  <h1>Nuevo evento de Incidencia</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${eventoIncidenciaInstance}">
    <div class="errors">
      <g:renderErrors bean="${eventoIncidenciaInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="descripcion"><g:message code="eventoIncidencia.descripcion.label" default="Descripcion"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: eventoIncidenciaInstance, field: 'descripcion', 'errors')}">
            <g:textArea name="descripcion" cols="40" rows="5" value="${eventoIncidenciaInstance?.descripcion}"/>
          </td>
        </tr>

        %{--<tr class="prop">--}%
        %{--<td valign="top" class="name">--}%
        %{--<label for="fechaCreacion"><g:message code="eventoIncidencia.fechaCreacion.label" default="Fecha Creacion" /></label>--}%
        %{--</td>--}%
        %{--<td valign="top" class="value ${hasErrors(bean: eventoIncidenciaInstance, field: 'fechaCreacion', 'errors')}">--}%
        %{--<g:datePicker name="fechaCreacion" precision="day" value="${eventoIncidenciaInstance?.fechaCreacion}"  />--}%
        %{--</td>--}%
        %{--</tr>--}%

        <g:hiddenField name="incidencia.id" value="${eventoIncidenciaInstance.incidencia.id}"/>

        %{--<tr class="prop">--}%
        %{--<td valign="top" class="name">--}%
        %{--<label for="incidencia"><g:message code="eventoIncidencia.incidencia.label" default="Incidencia" /></label>--}%
        %{--</td>--}%
        %{--<td valign="top" class="value ${hasErrors(bean: eventoIncidenciaInstance, field: 'incidencia', 'errors')}">--}%
        %{--<g:select name="incidencia.id" from="${hwsp.Incidencia.list()}" optionKey="id" value="${eventoIncidenciaInstance?.incidencia?.id}"  />--}%
        %{--</td>--}%
        %{--</tr>--}%

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="Crear"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
