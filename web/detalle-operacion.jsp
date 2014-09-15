<jsp:include page="header.jsp"/>
<h1>Detalles del Informe Operatorio Nro. xx
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
			<th>Tipo de Intervenci�n
			</th>
			<td colspan="5">${tipoIntervencion}
			</td>
		</tr>
		<tr>
			<th>Premedicaci�n
			</th>
			<td colspan="5">${premedicacion}
			</td>
		</tr>
		<tr>
			<th>Anest�sicos
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
			<th>Fecha interveci�n
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
			<th>Anestesi�logo
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
			
<table class="table table-hover">
		<tr>
			<th>D�as antes de la operaci�n
			</th>
			<td colspan="3">${detaoper.interAntOper} 
			</td>
		</tr>
		<tr>
			<th>Fecha de inicio
			</th>
			<td>${detaoper.fechaIniOper}
			</td>
			<th>Hora de inicio
			</th>
			<td>${detaoper.horaIniOper}
			</td>
		</tr>
		<tr>
			<th>Fecha de fin
			</th>
			<td>${detaoper.fechaFinOper}
			</td>
			<th>Hora de fin
			</th>
			<td>${detaoper.horaFinOper}
			</td>
		</tr>
		<tr>
			<th>Sala de operaci�n
			</th>
			<td colspan="3">${detaoper.salaOper.descSalaOper}
			</td>
		</tr>
		<tr>
			<th>&#8212; Hora de ingreso
			</th>
			<td>${detaoper.operHoraIni}
			</td>
			<th>Hora de egreso
			</th>
			<td>${detaoper.operHoraFin}	
			</td>
		</tr>
		<tr>
			<th>Sala de recuperaci�n
			</th>
			<td colspan="5">${detaoper.salaRecup.descSalaRecup}
			</td>
		</tr>
		<tr>
			<th>&#8212; Fecha de ingreso
			</th>
			<td>${detaoper.recupFechaIni}
			</td>
			<th>Hora de ingreso
			</th>
			<td>${detaoper.recupHoraIni}
			</td>
		</tr>
		<tr>
			<th>&#8212; Fecha de egreso
			</th>
			<td>${detaoper.recupFechaFin}
			</td>
			<th>Hora de egreso
			</th>
			<td>${detaoper.recupHoraFin}
			</td>
		</tr>
		<c:forEach var="map" items="${detaoper.detaProcs}" varStatus="i">
		<tr>
			<th>Intervenci�n Nro. ${i.count}
			</th>
			<td colspan="3">${map['IdProced']} - ${map['DescProced']}
			</td>
		</tr>
		</c:forEach>
		<tr>
			<th>Protocolo Operatorio
			</th>
			<td colspan="3">${detaoper.protocoloOperat}
			</td>
		</tr>
		<tr>
			<th>Digan�stico Pre Operatorio
			</th>
			<td colspan="3">${detaoper.diagPre.idCie} - ${detaoper.diagPre.descCie}
			</td>
		</tr>
		<tr>
			<th>Diagn�stico Post Operatorio
			</th>
			<td colspan="3">${detaoper.diagPost.idCie} - ${detaoper.diagPost.descCie}
			</td>
		</tr>
		<tr>
			<th>Descripci�n de Env�o
			</th>
			<td colspan="3">${detaoper.descEnvio}
			</td>
		</tr>
		<tr>
			<th>Observaciones de Env�o
			</th>
			<td colspan="3">${detaoper.obsEnvio}
			</td>
		</tr>
		<tr>
			<th>�Muestra enviada a Patolog�a?
			</th>
			<td colspan="3">${detaoper.patologia}
			</td>
		</tr>
		<tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${detaoper.patologiaEspec}
			</td>
		</tr>
		<tr>
			<th>Complicaci�n
			</th>
			<td colspan="3">${detaoper.comp.descComp}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${detaoper.compEspec}
			</td>
		</tr>
		<tr>
			<th>Condici�n de Egreso
			</th>
			<td colspan="3">${detaoper.condEgr.descCondEgr}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${detaoper.condEspec}
			</td>
		</tr>
	</table>		
	<div class="mt10">
		<a href="Servlet?v=detallePaciente&id=${idpac}" class="btn btn-sm btn-primary">Detalles del Paciente</a>
		<a href="Servlet?v=modificarInfoPre&id=${id}" class="btn btn-sm btn-success ml10">Modificar Informe</a>
		<a href="#" class="btn btn-sm btn-default ml10">Imprimir Detalles</a>
		<a href="Servlet?v=nuevoInfoPost&idpac=${idpac}&iddi=${id}" class="btn btn-warning btn-sm ml10">Crear Informe Post Operatorio</a>
	</div>
	<p></p>
</div>
<jsp:include page="footer.jsp"/>
