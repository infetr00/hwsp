<head>
  <meta name="layout" content="main"/>
  <title>Editar Roles de Usuario</title>

</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Inicio</a></span>
  <span class="menuButton"><a class="logout" href="${request.contextPath}/login/logout">Salir</a></span>
  <span class="menuButtonHola"><a class="hola">Hola ${session.user.nombre}!</a></span>
</div>

<div class="body">
  <h1>Editar Roles de Usuario</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>

  <div class="prop">
    <span class="name">ID:</span>
    <span class="value">${person.id}</span>
  </div>

  <g:form>
    <input type="hidden" name="id" value="${person.id}"/>
    <input type="hidden" name="version" value="${person.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><label for="nombre">Nombre:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'nombre', 'errors')}">
            <input type="text" id="nombre" name="nombre" value="${person.nombre?.encodeAsHTML()}" readonly/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="passwd">Password:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'passwd', 'errors')}">
            <input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}" readonly/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="email">Email:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'email', 'errors')}">
            <input type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}" readonly/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="telefono">Teléfono:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'telefono', 'errors')}">
            <input type="text" id="telefono" name="telefono" value="${person.telefono?.encodeAsHTML()}" readonly/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="authorities">Roles:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'authorities', 'errors')}">
            <ul>
              <g:each var="entry" in="${roleMap}">
                <li>${entry.key.authority.encodeAsHTML()}
                <g:checkBox id="${entry.key.authority}" class="rolescheck" onclick="javascript:uncheckroles(event);" name="${entry.key.authority}" value="${entry.value}"/>
                </li>
              </g:each>
            </ul>
          </td>

        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="updaterol" value="Actualiza"/></span>
      <span class="button"><g:actionSubmit class="delete" action="deleterol" onclick="return confirm('¿Estás seguro?');" value="Borrar Usuario"/></span>
    </div>

  </g:form>

</div>

<script type="text/javascript">
  function uncheckroles(event) {

    var roles = document.getElementsByClassName("rolescheck");

    for (i = 0; i < roles.length; i++) {
      roles[i].checked = "";
    }

    var rolClicked = document.getElementById(event.target.id).checked = "checked"
  }
</script>

</body>

