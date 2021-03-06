<jsp:include page="header.jsp"/>
<h1>Detalles del Paciente</h1>

    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#datos" role="tab" data-toggle="tab">Datos Generales</a></li>
        <li><a href="#historial" role="tab" data-toggle="tab">Historial de Operaciones</a></li>
    </ul>
	<div class="tab-content">
		<div class="tab-pane active" id="datos">
    <table class="table table-hover mt10">
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
            <th>Pa�s
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
            <th>Direcci�n
            </th>
            <td>${direccion}
            </td>
        </tr>
        <tr>
            <th>Nro. de Historia Cl�nica
            </th>
            <td>${numHc}
            </td>
        </tr>
        <tr>
            <th>Ocupaci�n
            </th>
            <td>${ocupacion}
            </td>
        </tr>
        <tr>
            <th>Fecha de Inscripci�n
            </th>
            <td>${fechaInscr}						
            </td>
        </tr>
    </table>
    <div>
		<a href="Servlet?v=nuevoInforme&idpac=${id}" class="btn btn-success btn-sm">Nuevo Informe Operatorio</a>		
        <a href="Servlet?v=modificarPaciente&id=${id}" class="btn btn-primary btn-sm ml10">Modificar Datos</a>
		<a href="javascript:window.print();" class="btn btn-default btn-sm ml10">Imprimir</a>
    </div>
	<div class="mt5">
		<a href="Servlet?v=nuevoInfoPost&idpac=${id}" class="btn btn-success btn-sm">Nuevo Informe Post Operatorio</a>		
		<a href="Servlet?v=nuevoInfoPre&idpac=${id}" class="btn btn-success btn-sm">Nuevo Informe Pre Operatorio</a>		
    </div>
		<p></p>
	</div>
		<div class="tab-pane" id="historial">
			
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Fecha</th>
					<th>Nombres y Apellidos</th>
					<th>Departamento</th>
					<th>Servicio</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<tbody>
				<td>14/09/2014</td>
				<td>Alain Melquiades Alejo Huarachi</td>
				<td>xxxxxxxxxxxxx</td>
				<td>yyyyyyyy</td>
				<td><a href="Servlet?v=detalleOperacion&id=x" class="btn btn-info btn-xs">Detalles</a></td>
			</tbody>
		</table>			

    <h2>Informes Pre Operatorios
    </h2>
    <% if (request.getAttribute("tablaInfoPre").equals("")) { %>
    <p>No hay informes registrados</p>	
    <% } else { %>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Fecha
                </th>
                <th>Departamento
                </th>
                <th>Servicio
                </th>
                <th>Tipo de intervenci�n
                </th>
                <th>Opciones
                </th>
            </tr>
        </thead>
        <tbody>
            ${tablaInfoPre}
        </tbody>
    </table>
    <% } %>
    
    <h2>Informes Post Operatorios
    </h2>
    <% if (request.getAttribute("tablaInfoPost").equals("")) { %>
    <p>No hay informes registrados</p>	
    <% } else { %>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Fecha de Inicio
                </th>
                <th>Fecha de Fin
                </th>
                <th>Sala de Oper.
                </th>
                <th>Sala de Recup.
                </th>
                <th>Opciones
                </th>
            </tr>
        </thead>
        <tbody>
            ${tablaInfoPost}
        </tbody>
    </table>
    <% }%>

   </div>
	</div>

<jsp:include page="footer.jsp"/>