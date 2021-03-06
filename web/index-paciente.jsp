<jsp:include page="header.jsp"/>
<h1>Buscar Paciente
</h1>
<form role="form" class="form-inline" action="Servlet?v=indexPaciente" method="get">
	<div class="form-group">
		<div class="input-group">
			<input type="text" placeholder="DNI, Nombre y Apellido � Nro. de Historia Cl�nica" size="50" class="form-control input-sm" name="q" value="${q}">
			<span class="input-group-btn">
				<button type="submit" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-search"></span></button>
			</span>
		</div>
	</div>		
	<a href="Servlet?v=nuevoPaciente" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-file"></span> Nuevo Paciente</a>
</form>
<div class="content content-table">
<% if(request.getAttribute("q") != null){ if(request.getAttribute("tabla").equals("")){ %>
No se encontraron resultados
<% } else{ %>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombres
			</th>
			<th>Apellido Paterno
			</th>
			<th>Apellido Materno
			</th>
			<th>DNI
			</th>
			<th>Historia Cl�nica
			</th>
			<th>Opciones
			</th>
		</tr>
	</thead>
	<tbody>
		${tabla}
	</tbody>
</table>
<% } } %>
</div>
<jsp:include page="footer.jsp"/>
