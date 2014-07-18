<jsp:include page="header.jsp"/>
<h1>Detalles del Paciente
    <div class="btn-group right">
        <button type="button" data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">Opciones <span class="caret"></span>
        </button>
        <ul role="menu" class="dropdown-menu dropdown-menu-right">
            <li><a href="Servlet?v=modificarPaciente&id=${id}">Modificar Paciente</a>
            </li>
            <li><a href="Servlet?v=nuevoInfoPre&idpac=${id}">Crear Informe Pre Operatorio</a>
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
            <th>Ocupación
            </th>
            <td>${ocupacion}
            </td>
        </tr>
        <tr>
            <th>Fecha de Inscripción
            </th>
            <td>${fechaInscr}						
            </td>
        </tr>
    </table>

    <div class="mt15">
        <a href="Servlet?v=modificarPaciente&id=${id}" class="btn btn-primary btn-sm">Modificar Datos</a>
    </div>               

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
                <th>Tipo de intervención
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
    <div class="mt15">
        <a href="Servlet?v=nuevoInforme&idpac=${id}" class="btn btn-success btn-sm">Nuevo Informe Operatorio</a>
        <a href="Servlet?v=nuevoInfoPre&idpac=${id}" class="btn btn-success btn-sm ml10">Crear Informe Pre Operatorio</a>
        <a href="#" class="btn btn-default btn-sm ml10">Imprimir</a>
    </div>
    <p></p>
</div>
<jsp:include page="footer.jsp"/>