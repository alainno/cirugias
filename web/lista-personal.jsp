<jsp:include page="header.jsp"/>
<header class="clearfix">
    <h1 class="left">Personal Médico</h1>
    <a href="#myModal4" class="right btn btn-info btn-xs" data-toggle="modal" data-titulo="Nuevo Personal">Nuevo</a>
</header>
<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Opciones</th>
		</tr>
	</thead>
	<tbody>
            <tr>
		<td>123</td>
		<td>DR. JUAN LUQUE</td>
		<td>
                    <a href="#myModal4" class="btn btn-info btn-xs" data-toggle="modal" data-titulo="Modificar Personal">Editar</a>
                    <a href="json/test-data.json" class="btn btn-info btn-xs lnk-borrar">Borrar</a>
                </td>
            </tr>
            <tr>
		<td>123</td>
		<td>DR. JUAN LUQUE</td>
		<td>
                    <a href="#" class="btn btn-info btn-xs">Editar</a>
                    <a href="#" class="btn btn-info btn-xs">Borrar</a>
                </td>
            </tr>
            <tr>
		<td>123</td>
		<td>DR. JUAN LUQUE</td>
		<td>
                    <a href="#" class="btn btn-info btn-xs">Editar</a>
                    <a href="#" class="btn btn-info btn-xs">Borrar</a>
                </td>
            </tr>
	</tbody>
</table>
<jsp:include page="includes/modal-personal.jsp"/>

<jsp:include page="footer.jsp">
    <jsp:param name="masScripts" value="js/lista-personal.js" />
</jsp:include>