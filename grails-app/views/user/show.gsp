<head>
  <meta name="layout" content="main"/>
  <title>Información de Usuario</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Volver</a></span>
</div>


<div class="body">
  <h1>Información de Usuario</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">ID:</td>
        <td valign="top" class="value">${person.id}</td>
      </tr>

      <tr class="prop">
        <td valign="top" cla="name">Nombre:</td>
        <td valign="top" class="value">${person.nombre?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Email:</td>
        <td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">Teléfono:</td>
        <td valign="top" class="value">${person.telefono?.encodeAsHTML()}</td>
      </tr>


      <tr class="prop">
        <td valign="top" class="name">Roles:</td>
        <td valign="top" class="value">
          <ul>
            <g:each in="${roleNames}" var='name'>
              <li>${name}</li>
            </g:each>
          </ul>
        </td>
      </tr>

      </tbody>
    </table>
  </div>

  %{--<div class="buttons">--}%
    %{--<g:form>--}%
      %{--<input type="hidden" name="id" value="${person.id}"/>--}%
      %{--<span class="button"><g:actionSubmit class="edit" value="Edit"/></span>--}%
      %{--<span class="button"><g:actionSubmit class="delete" onclick="return confirm('¿Estás seguro?');" value="Delete"/></span>--}%
    %{--</g:form>--}%
  %{--</div>--}%

</div>
</body>
