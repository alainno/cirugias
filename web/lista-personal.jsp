<jsp:include page="header.jsp"/>
<h1>Personal Médico</h1>
<form role="form" class="form-inline" action="Servlet?v=listaPersonal" method="get">
	<div class="form-group">
		<div class="input-group w200">
			<input type="text" placeholder="Buscar..." size="50" class="form-control input-sm" name="q" value="${q}" disabled="disabled">
			<span class="input-group-btn">
				<button type="submit" class="btn btn-sm btn-default" disabled="disabled"><span class="glyphicon glyphicon-search"></span></button>
			</span>
		</div>
	</div>
	<div class="form-group">
		<a href="#myModal4" class="btn btn-primary btn-sm lnk-open-modal" data-titulo="Nuevo Personal" data-form-action="Ajax?v=guardarPersonal"><span class="glyphicon glyphicon-file"></span> Nuevo</a>				
	</div>
</form>
<div class="content content-table">
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
                    <a href="#myModal4" class="btn btn-info btn-xs lnk-open-modal" data-pre-data="Ajax?v=test" data-titulo="Modificar Personal" data-form-action="Ajax?v=guardarPersonal&id="><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                    <a href="Ajax?v=borrarPersonal&id=" class="btn btn-info btn-xs lnk-borrar"><span class="glyphicon glyphicon-trash"></span> Borrar</a>
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
</div>
<jsp:include page="includes/modal-personal.jsp"/>

<jsp:include page="footer.jsp">
    <jsp:param name="masScripts" value="js/lista-personal.js" />
</jsp:include>