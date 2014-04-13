<jsp:include page="header.jsp"/>
<h1>Detalles del Informe Post Operatorio
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
			<td>${nombres}
			</td>
		</tr>
		<tr>
			<th>Días antes de la operación
			</th>
			<td colspan="3">${InterAntOper} 
			</td>
		</tr>
		<tr>
			<th>Fecha de inicio
			</th>
			<td>${FechaIniOper}
			</td>
			<th>Hora de inicio
			</th>
			<td>${HoraIniOper}
			</td>
		</tr>
		<tr>
			<th>Fecha de fin
			</th>
			<td>${FechaFinOper}
			</td>
			<th>Hora de fin
			</th>
			<td>${HoraFinOper}
			</td>
		</tr>
		<tr>
			<th>Sala de operación
			</th>
			<td colspan="3">${DescSalaOper}
			</td>
		</tr>
		<tr>
			<th>Hora de ingreso
			</th>
			<td>${OperHoraIni}
			</td>
			<th>Hora de egreso
			</th>
			<td>${OperHoraFin}	
			</td>
		</tr>
		<tr>
			<th>Sala de recuperación
			</th>
			<td colspan="5">${DescSalaRecup}
			</td>
		</tr>
		<tr>
			<th>Fecha de ingreso
			</th>
			<td>${RecuFechaIni}
			</td>
			<th>Hora de ingreso
			</th>
			<td>${RecupHoraIni}
			</td>
		</tr>
		<tr>
			<th>Fecha de egreso
			</th>
			<td>${RecupFechaFin}
			</td>
			<th>Hora de egreso
			</th>
			<td>${RecupHoraFin}
			</td>
		</tr>
		<tr>
			<th>Intervención Nr. 1
			</th>
			<td colspan="3">${DescProced1}
			</td>
		</tr>
		<tr>
			<th>Intervención Nr. 2
			</th>
			<td colspan="3">${DescProced2}
			</td>
		</tr>
		<tr>
			<th>Intervención Nr. 3
			</th>
			<td colspan="3">${DescProced3}
			</td>
		</tr>
		<tr>
			<th>Protocolo Operatorio
			</th>
			<td colspan="3">${ProtocoloOperat}
			</td>
		</tr>
		<tr>
			<th>Diganóstico Pre Operatorio
			</th>
			<td colspan="3">${DescDiagPre}
			</td>
		</tr>
		<tr>
			<th>Diagnóstico Post Operatorio
			</th>
			<td colspan="3">${DescDiagPost}
			</td>
		</tr>
		<tr>
			<th>Descripción de Envío
			</th>
			<td colspan="3">${DescEnvio}
			</td>
		</tr>
		<tr>
			<th>Observaciones de Envío
			</th>
			<td colspan="3">${ObsEnvio}
			</td>
		</tr>
		<tr>
			<th>¿Muestra enviada a Patología?
			</th>
			<td colspan="3">${Patologia}
			</td>
		</tr>
		<tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${PatologiaEspec}
			</td>
		</tr>
		<tr>
			<th>Complicación
			</th>
			<td colspan="3">${DescComp}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${CompEspec}
			</td>
		</tr>
		<tr>
			<th>Condición de Egreso
			</th>
			<td colspan="3">${DescCondEgr}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificación
			</th>
			<td colspan="3">${CondEspec}
			</td>
		</tr>
	</table>
	<div class="mt10"><a href="vista-paciente.html" class="btn btn-primary">Detalles del Paciente</a><a href="form-info-post.html" class="btn btn-warning ml10">Modificar Informe</a><a href="#" class="btn btn-default ml10">Imprimir Detalles</a>
	</div>
</div>
<jsp:include page="footer.jsp"/>