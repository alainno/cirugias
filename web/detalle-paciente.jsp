<jsp:include page="header.jsp"/>
<h1>Detalles del Paciente
	<div class="btn-group right">
		<button type="button" data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">Opciones <span class="caret"></span>
		</button>
		<ul role="menu" class="dropdown-menu dropdown-menu-right">
			<li><a href="editar-paciente.html">Modificar Paciente</a>
			</li>
			<li><a href="nuevo-info-pre.html">Crear Informe Pre Operatorio</a>
			</li>
			<li><a href="#">Crear Informe Post Operatorio</a>
			</li>
			<li><a href="#">Imprimir Detalles								</a>
			</li>
		</ul>
	</div>
</h1>
<div class="content">
		<table class="table table-hover">
			<tr>
                <th>Nro. de DNI
                </th>
                <td>${dni}
                </td>
			</tr>
			<tr>
                <th>Nombres
                </th>
                <td>${nombres}
                </td>
			</tr>
			<tr>
                <th>Apellido Paterno
                </th>
                <td>${apPaterno}
                </td>
			</tr>
			<tr>
                <th>Apellido Materno
                </th>
                <td>${apMaterno}
                </td>
			</tr>
			<tr>
                <th>Fecha de Nacimiento
                </th>
                <td>${fechaNac}
                </td>
			</tr>
			<tr>
                <th>Edad
                </th>
                <td>${edad}
                </td>
			</tr>
			<tr>
                <th>Tipo de Edad
                </th>
                <td>${tipoEdad}
                </td>
			</tr>
			<tr>
                <th>Sexo
                </th>
                <td>${sexo}
                </td>
			</tr>
			<tr>
                <th>País
                </th>
                <td>${pais}
                </td>
			</tr>
			<tr>
                <th>Departamento
                </th>
                <td>${departamento}
                </td>
			</tr>
			<tr>
                <th>Provincia
                </th>
                <td>${provincia}
                </td>
			</tr>
			<tr>
                <th>Distrito
                </th>
                <td>${distrito}
                </td>
			</tr>
			<tr>
                <th>Dirección
                </th>
                <td>${direccion}
                </td>
			</tr>
			<tr>
                <th>Nro. de Historia Clínica
                </th>
                <td>${numHc}
                </td>
			</tr>
			<tr>
                <th>Fecha de Inscripción
                </th>
                <td>${fechaInscr}						
                </td>
			</tr>
		</table><!--.main-col-right.right
		<div><a href="editar-paciente.html" class="btn btn-primary btn-block">Modificar Paciente</a>
		</div>
		<div class="mt10"><a href="nuevo-info-pre.html" class="btn btn-success btn-block">Crear Informe Pre Operatorio</a>
		</div>
		<div class="mt10"><a href="#" class="btn btn-warning btn-block">Crear Informe Post Operatorio</a>
		</div>
		<div class="mt10"><a href="#" class="btn btn-default btn-block">Imprimir Detalles</a>
		</div>-->
	<h2>Informes Pre Operatorios
	</h2>
	<table class="table table-hover">
		<thead>
			<tr>
                <th>Fecha
                </th>
                <th>Departamento
                </th>
                <th>Servicio
                </th>
                <th>Tipo de intervención
                </th>
                <th>Opciones
                </th>
			</tr>
		</thead>
		<tbody>
			<tr>
                <td>17/03/2014
                </td>
                <td>ODONTOESTOMATOLOGIA
                </td>
                <td>MEDICINA ESPECIALIZADA
                </td>
                <td>PROGRAMADA
                </td>
                <td><a href="detalles-info-pre.html" class="btn btn-xs btn-success">Detalles</a>
                </td>
			</tr>
		</tbody>
	</table>
	<h2>Informes Post Operatorios
	</h2>
	<p>No hay informes registrados
	</p>
</div>
<jsp:include page="footer.jsp"/>