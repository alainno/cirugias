<jsp:include page="header.jsp"/>
<h1>INFORME OPERATORIO
</h1>
<div class="content">
	<table class="table table-hover">
		<tr>
			<th>Informe Nro.</th>
			<td></td>
			<th>Fecha de Inscripci�n</th>
			<td>dd/mm/YYY</td>
			<th>Nro. de H. Cl�nica</th>
			<td></td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>Apellidos
			</th>
			<td colspan="2">${apellidos}				
			</td>
			<th>Nombres
			</th>
			<td colspan="2">${nombres}
			</td>
		</tr>
		<tr>
			<th>Edad</th>
			<td colspan="2"></td>
			<th>Sexo</th>
			<td colspan="2"></td>
		</tr>
		<tr>
			<th>Ocupaci�n</th>
			<td colspan="2"></td>
			<th>Procedencia</th>
			<td colspan="2"></td>
		</tr>
		<tr>
			<th>Departamento
			</th>
			<td colspan="2">${departamento}
			</td>
			<th>Servicio
			</th>
			<td colspan="2">${servicio}
			</td>
		</tr>
		<tr>
			<th>Piso
			</th>
			<td>${piso}
			</td>
			<th>Sala N�
			</th>
			<td>${sala}
			</td>
			<th>Cama N�
			</th>
			<td>${cama}
			</td>
		</tr>
		<tr>
			<th colspan="3">Dias de internamiento antes de la operaci�n</th>
			<td></td>
			<th>Tipo de Intervenci�n
			</th>
			<td>${tipoIntervencion}
			</td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th colspan="2">Diagn�stico Pre Operatorio</th>
			<th colspan="4"></th>
		</tr>
		<tr>
			<th>Premedicaci�n
			</th>
			<td colspan="2">${premedicacion}
			</td>
			<th>Hora Inicio Anestecia</th>
			<td colspan="2">DE: A:</td>
		</tr>
		<tr>
			<th>Anestecia</th>
			<td></td>
			<th>Anest�sicos
			</th>
			<td>${anestesicos}
			</td>
			<th>Cantidad
			</th>
			<td>${cantidad}
			</td>
		</tr>
		<tr>
			<th>Anestesi�logo
			</th>
			<td colspan="3">
			</td>
			<th>Firma
			</th>
			<td>
			</td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>Intervenci�n 1</th>
			<td colspan="3"></td>
			<th>C�digo</th>
			<td></td>
		</tr>
		<tr>
			<th>Intervenci�n 2</th>
			<td colspan="3"></td>
			<th>C�digo</th>
			<td></td>
		</tr>
		<tr>
			<th>Intervenci�n 3</th>
			<td colspan="3"></td>
			<th>C�digo</th>
			<td></td>
		</tr>
		<tr>
			<th>Hora de Ingreso
			</th>
			<td></td>
			<th>Sala Operaci�n N�</th>
			<td></td>
			<th>Hora de Egreso</th>
			<td></td>
		</tr>
		<tr>
			<th>Fecha de Operaci�n</th>
			<td colspan="5"> ... de ........ del ......</td>
		</tr>
		<tr>
			<th>Hora de Inicio</th>
			<td></td>
			<th>Hora de T�rmino</th>
			<td></td>
			<th>Duraci�n</th>
			<td>hh:mm</td>
		</tr>
		<tr>
			<th>Cirujano nombre
			</th>
			<td colspan="3">${cirujano}
			</td>
			<th>Firma</th>
			<td></td>
		</tr>
		<tr>
			<th>Primer ayudante
			</th>
			<td colspan="3">${primerAyudante}
			</td>
			<th>Firma</th>
			<td></td>		
		</tr>
		<tr>
			<th>Segundo Ayudante
			</th>
			<td colspan="3">${segundoAyudante}
			</td>
			<th>Firma</th>
			<td></td>			
		</tr>
		<tr>
			<th>Instrumentista
			</th>
			<td colspan="3">${instrumentista}
			</td>
			<th>Firma</th>
			<td></td>		
		</tr>
		<tr>
			<th>Circulante
			</th>
			<td colspan="3">${circulante}
			</td>
			<th>Firma</th>
			<td></td>			
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>Protocolo Operatorio</th>
		</tr>
		<tr><td>text</td></tr>
	</table>

	<table class="table table-hover table-bordered">
		<tr>
			<th>Diagn�stico Post Operatorio
			</th>
			<td colspan="5">${detaoper.diagPost.idCie} - ${detaoper.diagPost.descCie}
			</td>
		</tr>
		<tr>
			<th colspan="2">Sala de Recuperaci�n</th>
			<th>Hora de Ingreso</th>
			<td></td>
			<th>Hora de Egreso</th>
			<td></td>
		</tr>
		<tr>
			<th>Nombre</th>
			<td colspan="5"></td>
		</tr>
		<tr>
			<th colspan="6">Complicaciones</th>
		</tr>
		<tr>
			<th>Por anestecia</th>
			<td></td>
			<th>Especifique:</th>
			<td colspan="3"></td>
		</tr>
		<tr>
			<th>En acto quirurgico</th>
			<td></td>
			<th>Especifique:</th>
			<td colspan="3"></td>
		</tr>
		<tr>
			<th>En sala de recuperaci�n</th>
			<td></td>
			<th>Especifique:</th>
			<td colspan="3"></td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>Condici�n de egreso</th>
			<td colspan="5"></td>
		<tr>
			<th>Por anestecia</th>
			<td></td>
			<th>En Operaci�n</th>
			<td></td>
			<th>En recuperaci�n</th>
			<td></td>
		</tr>
		<tr>
			<th>Suspendido</th>
			<td></td>
			<th>Especifique:</th>
			<td colspan="3"></td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>�Muestra enviada a Patolog�a?
			</th>
			<td></td>
			<th>Especifique</th>
			<td colspan="3"></td>
		</tr>
	</table>
	<table class="table table-hover table-bordered">
		<tr>
			<th>Observaciones</th>
		</tr>
		<tr><td>text</td></tr>
	</table>		
	<div class="mt10">
		<a href="#" class="btn btn-sm btn-default lnk-print"><span class="glyphicon glyphicon-print"></span> Imprimir</a>
		<a href="Servlet?v=nuevoInforme&id=${id}" class="btn btn-sm btn-success ml10">Modificar Informe</a>
		<a href="Servlet?v=detallePaciente&id=${idpac}" class="btn btn-sm btn-primary ml10">Detalles del Paciente</a>
	</div>
	<p></p>
</div>
<jsp:include page="footer.jsp"/>
