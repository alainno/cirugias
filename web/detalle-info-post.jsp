<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>
<h1>Detalles del Informe Post Operatorio
</h1>
<div class="content">
	<table class="table table-hover">
		<tr>
			<th>Apellidos
			</th>
			<td>${detaoper.paciente.apPaterno} ${detaoper.paciente.apMaterno}
			</td>
			<th>Nombres
			</th>
			<td>${detaoper.paciente.nombres}
			</td>
		</tr>
		<tr>
			<th>Días antes de la operación
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
			<th>Sala de operación
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
			<th>Sala de recuperación
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
			<th>Intervención Nro. ${i.count}
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
			<th>Diganóstico Pre Operatorio
			</th>
			<td colspan="3">${detaoper.diagPre.idCie} - ${detaoper.diagPre.descCie}
			</td>
		</tr>
		<tr>
			<th>Diagnóstico Post Operatorio
			</th>
			<td colspan="3">${detaoper.diagPost.idCie} - ${detaoper.diagPost.descCie}
			</td>
		</tr>
		<tr>
			<th>Descripción de Envío
			</th>
			<td colspan="3">${detaoper.descEnvio}
			</td>
		</tr>
		<tr>
			<th>Observaciones de Envío
			</th>
			<td colspan="3">${detaoper.obsEnvio}
			</td>
		</tr>
		<tr>
			<th>¿Muestra enviada a Patología?
			</th>
			<td colspan="3">${detaoper.patologia}
			</td>
		</tr>
		<tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${detaoper.patologiaEspec}
			</td>
		</tr>
		<tr>
			<th>Complicación
			</th>
			<td colspan="3">${detaoper.comp.descComp}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${detaoper.compEspec}
			</td>
		</tr>
		<tr>
			<th>Condición de Egreso
			</th>
			<td colspan="3">${detaoper.condEgr.descCondEgr}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${detaoper.condEspec}
			</td>
		</tr>
	</table>
	<div class="mt10"><a href="vista-paciente.html" class="btn btn-primary">Detalles del Paciente</a><a href="form-info-post.html" class="btn btn-warning ml10">Modificar Informe</a><a href="#" class="btn btn-default ml10">Imprimir Detalles</a>
	</div>
</div>
<jsp:include page="footer.jsp"/>