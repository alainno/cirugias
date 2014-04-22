<jsp:include page="header.jsp"/>
<h1>Detalles del Informe Pre Operatorio
</h1>
<div class="content">
	<table class="table table-hover">
		<tr>
			<th>Apellidos
			</th>
			<td>${apellidos}				
			</td>
			<th>Nombres
			</th>
			<td colspan="3">${nombres}
			</td>
		</tr>
		<tr>
			<th>Departamento
			</th>
			<td>${departamento}
			</td>
			<th>Piso
			</th>
			<td colspan="3">${piso}
			</td>
		</tr>
		<tr>
			<th>Servicio
			</th>
			<td>${servicio}
			</td>
			<th>Sala
			</th>
			<td>${sala}
			</td>
			<th>Cama
			</th>
			<td>${cama}
			</td>
		</tr>
		<tr>
			<th>Tipo de Intervención
			</th>
			<td colspan="5">${tipoIntervencion}
			</td>
		</tr>
		<tr>
			<th>Premedicación
			</th>
			<td colspan="5">${premedicacion}
			</td>
		</tr>
		<tr>
			<th>Anestésicos
			</th>
			<td>${anestesicos}
			</td>
			<th>Cantidad
			</th>
			<td colspan="3">${cantidad}
			</td>
		</tr>
		<tr>
			<th>Antestesia
			</th>
			<td>${anestesia}
			</td>
			<th>Inicio
			</th>
			<td>${inicio} Hrs.
			</td>
			<th>Final
			</th>
			<td>${fin} Hrs.
			</td>
		</tr>
		<tr>
			<th>Fecha interveción
			</th>
			<td colspan="5">${fechaInterv}
			</td>
		</tr>
		<tr>
			<th>Cirujano
			</th>
			<td colspan="5">${cirujano}
			</td>
		</tr>
		<tr>
			<th>Primer ayudante
			</th>
			<td colspan="5">${primerAyudante}
			</td>
		</tr>
		<tr>
			<th>Segundo Ayudante
			</th>
			<td colspan="5">${segundoAyudante}
			</td>
		</tr>
		<tr>
			<th>Instrumentista
			</th>
			<td colspan="5">${instrumentista}
			</td>
		</tr>
		<tr>
			<th>Circulante
			</th>
			<td colspan="5">${circulante}
			</td>
		</tr>
		<tr>
			<th>Anestesiólogo
			</th>
			<td colspan="5">${anestesiologo}
			</td>
		</tr>
		<tr>
			<th>Especialista
			</th>
			<td colspan="5">${especialista}
			</td>
		</tr>
	</table>
	<div class="mt10">
		<a href="Servlet?v=detallePaciente&id=${idpac}" class="btn btn-sm btn-primary">Detalles del Paciente</a>
		<a href="Servlet?v=modificarInfoPre&id=${id}" class="btn btn-sm btn-success ml10">Modificar Informe</a>
		<a href="#" class="btn btn-sm btn-default ml10">Imprimir Detalles</a>
		<a href="Servlet?v=nuevoInfoPost&idpac=${idpac}" class="btn btn-warning btn-sm ml10">Crear Informe Post Operatorio</a>
	</div>
	<p></p>
</div>
<jsp:include page="footer.jsp"/>