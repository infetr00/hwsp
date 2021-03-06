<%@ page import="hwsp.User" %>
<head>
  <meta name="layout" content="main"/>
  <title>Usuario List</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  %{--<g:menuBarControl/>--}%
</div>

<div class="body">
  <h1>User List</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="id" title="Id"/>
        <g:sortableColumn property="nombre" title="Nombre"/>
        <g:sortableColumn property="email" title="Email"/>
        <g:sortableColumn property="telefono" title="Telefono"/>
        <th>&nbsp;</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td>${person.id}</td>
          <td>${person.nombre?.encodeAsHTML()}</td>
          <td>${person.email?.encodeAsHTML()}</td>
          <td>${person.telefono?.encodeAsHTML()}</td>
          <td class="actionButtons">
            <span class="actionButton">
              <g:link action="show" id="${person.id}">Mostrar</g:link>
            </span>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${User.count()}"/>
  </div>

</div>
</body>
