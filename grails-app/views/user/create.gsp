<head>
	<meta name="layout" content="main" />
	<title>Create User</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
	</div>

	<div class="body">
		<h1>Create User</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><label for="nombre">Nombre:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'nombre','errors')}">
							<input type="text" id="nombre" name="nombre" value="${person.nombre?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="passwd">Password:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
							<input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="email">Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
							<input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="telefono">Teléfono:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
							<input type="text" id="telefono" name="telefono" value="${person.telefono?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name" align="left">Asignar Roles:</td>
					</tr>

					<g:each in="${authorityList}">
					<tr>
						<td valign="top" class="name" align="left">${it.description.encodeAsHTML()}</td>
						<td align="left"><g:checkBox name="${it.authority}"/></td>
					</tr>
					</g:each>

				</tbody>
				</table>
			</div>

			<div class="buttons">
				<span class="button"><input class="save" type="submit" value="Create" /></span>
			</div>

		</g:form>

	</div>
</body>
