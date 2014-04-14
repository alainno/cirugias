<jsp:include page="header.jsp"/>
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
			<th>Hora de ingreso
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
			<th>Fecha de ingreso
			</th>
			<td>${detaoper.recupFechaIni}
			</td>
			<th>Hora de ingreso
			</th>
			<td>${detaoper.recupHoraIni}
			</td>
		</tr>
		<tr>
			<th>Fecha de egreso
			</th>
			<td>${detaoper.recupFechaFin}
			</td>
			<th>Hora de egreso
			</th>
			<td>${detaoper.recupHoraFin}
			</td>
		</tr>
		<tr>
			<th>Intervenci�n Nr. 1
			</th>
			<td colspan="3">${DescProced1}
			</td>
		</tr>
		<tr>
			<th>Intervenci�n Nr. 2
			</th>
			<td colspan="3">${DescProced2}
			</td>
		</tr>
		<tr>
			<th>Intervenci�n Nr. 3
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
			<th>Digan�stico Pre Operatorio
			</th>
			<td colspan="3">${DescDiagPre}
			</td>
		</tr>
		<tr>
			<th>Diagn�stico Post Operatorio
			</th>
			<td colspan="3">${DescDiagPost}
			</td>
		</tr>
		<tr>
			<th>Descripci�n de Env�o
			</th>
			<td colspan="3">${DescEnvio}
			</td>
		</tr>
		<tr>
			<th>Observaciones de Env�o
			</th>
			<td colspan="3">${ObsEnvio}
			</td>
		</tr>
		<tr>
			<th>�Muestra enviada a Patolog�a?
			</th>
			<td colspan="3">${Patologia}
			</td>
		</tr>
		<tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${PatologiaEspec}
			</td>
		</tr>
		<tr>
			<th>Complicaci�n
			</th>
			<td colspan="3">${DescComp}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${CompEspec}
			</td>
		</tr>
		<tr>
			<th>Condici�n de Egreso
			</th>
			<td colspan="3">${DescCondEgr}
			</td>
		<tr>
		</tr>
			<th>&#8212; Especificaci�n
			</th>
			<td colspan="3">${CondEspec}
			</td>
		</tr>
	</table>
	<div class="mt10"><a href="vista-paciente.html" class="btn btn-primary">Detalles del Paciente</a><a href="form-info-post.html" class="btn btn-warning ml10">Modificar Informe</a><a href="#" class="btn btn-default ml10">Imprimir Detalles</a>
	</div>
</div>
<jsp:include page="footer.jsp"/>