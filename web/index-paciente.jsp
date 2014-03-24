<jsp:include page="header.jsp"/>
<h1>Buscar Paciente
</h1>
<form role="form" class="form-inline">
	<div class="form-group">
		<input type="text" placeholder="DNI, Nombre y Apellido � Nro. de Historia Cl�nica" size="50" class="form-control input-sm">
	</div>
	<button type="submit" class="btn btn-sm btn-default">Buscar
	</button>&nbsp;
	<a href="nuevo-paciente.html" class="btn btn-sm btn-primary">Nuevo Paciente</a>
</form>
<table class="table table-hover mt15">
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
		<tr>
			<td>Alain
			</td>
			<td>Alejo
			</td>
			<td>Huarachi
			</td>
			<td>42447799
			<td>99995555
			</td>
			<td><a href="Servlet?v=detallePaciente&id=47" class="btn btn-xs btn-primary">Detalles</a>
			</td>
		</tr>
		<tr>
			<td>Alain
			</td>
			<td>Alejo
			</td>
			<td>Huarachi
			</td>
			<td>42447799
			</td>
			<td>99995555
			</td>
			<td><a href="vista-paciente.html" class="btn btn-xs btn-primary">Detalles</a>
			</td>
		</tr>
		<tr>
			<td>Alain
			</td>
			<td>Alejo
			</td>
			<td>Huarachi
			</td>
			<td>42447799
			</td>
			<td>99995555
			</td>
			<td><a href="vista-paciente.html" class="btn btn-xs btn-primary">Detalles</a>
			</td>
		</tr>
		<tr>
			<td>Alain
			</td>
			<td>Alejo
			</td>
			<td>Huarachi
			</td>
			<td>42447799
			</td>
			<td>99995555
			</td>
			<td><a href="vista-paciente.html" class="btn btn-xs btn-primary">Detalles</a>
			</td>
		</tr>
		<tr>
			<td>Alain
			</td>
			<td>Alejo
			</td>
			<td>Huarachi
			</td>
			<td>42447799
			</td>
			<td>99995555
			</td>
			<td><a href="vista-paciente.html" class="btn btn-xs btn-primary">Detalles</a>
			</td>
		</tr>
	</tbody>
</table>
<jsp:include page="footer.jsp"/>
