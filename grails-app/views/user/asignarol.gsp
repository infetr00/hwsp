<head>
  <meta name="layout" content="main"/>
  <title>Asignar Roles</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Inicio</a></span>
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span>


  %{--<g:menuBarControl/>--}%
</div>

<div class="body">
  <h1>Asignar Roles</h1>
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
        <g:sortableColumn property="telefono" title="Teléfono"/>
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
              <g:if test="${person.authorities.isEmpty()}">
                <g:link action="editrol" id="${person.id}">Usuario sin roles. Añadir rol</g:link>

              </g:if>
              <g:else>
                <g:link action="editrol" id="${person.id}">Editar Roles</g:link>
              </g:else>

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
