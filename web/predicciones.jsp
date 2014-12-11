<jsp:include page="header.jsp"/>
<h1>Predicciones</h1>
<form role="form" class="form-inline" action="" method="get">
	<div class="form-group">
		<label class="control-label">Indicador</label>
		<select name="select1" id="select1" class="form-control input-sm">
			<option value="">- Seleccionas -</option>
			<option value="">Nro. de Intervenciones Quirurgicas</option>
			<option value="">Nro. de Pacientes Operados</option>
			<option value="">Aprovechamiento de Salas de Operaciones</option>
			<option value="">GRADO DE CUMPLIMIENTO DE LAS OPERACIONES PROGRAMADAS</option>
			<option value="">RENDIMIENTO QUIROFANO</option>
			<option value="">PORCENTAJE DE INTERVENCIONES QUIRURGICAS SUSPENDIDAS</option>
			<option value="">NUMERO DE INTERVENCIONES QUIRURGICAS PENDIENTES</option>
			<option value="">PROMEDIO DE DIAS PREOPERATORIOS</option>
			<option value="">PORCENTAJE DE INFECCIONES POST QUIRURGICAS</option>
			<option value="">PORCENTAJE DE COMPLICACIONES INTRAOPERATORIAS (transoperatorias)</option>
			<option value="">PORCENTAJE DE COMPLICACIONES POST OPERATORIAS</option>
			<option value="">PORCENTAJE DE COMPLICACIONES ANESTESICAS</option>
			<option value="">PORCENTAJE DE COMPLICACIONES EN RECUPERACION</option>
			<option value="">PORCENTAJE DE DISCREPANCIAS ENTRE DIAGNOSTICO PRE Y POST QUIRURGICO</option>
			<option value="">TASA DE MORTALIDAD EN EL CENTRO QUIRURGICO</option>
		</select>
	</div>
</form>
<div class="content content-table">
	<form name="form1" action="" method="post" class="form-horizontal mt15">
		<div class="form-group">
			<label class="control-label col-sm-6">Nro. de Intervenciones Quirurgicas</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" disabled="disabled" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">Nro. de Pacientes Operados</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">Aprovechamiento de Salas de Operaciones</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">GRADO DE CUMPLIMIENTO DE LAS OPERACIONES PROGRAMADAS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">RENDIMIENTO QUIROFANO</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE INTERVENCIONES QUIRURGICAS SUSPENDIDAS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">NUMERO DE INTERVENCIONES QUIRURGICAS PENDIENTES</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PROMEDIO DE DIAS PREOPERATORIOS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE INFECCIONES POST QUIRURGICAS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE COMPLICACIONES INTRAOPERATORIAS (transoperatorias)</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE COMPLICACIONES POST OPERATORIAS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE COMPLICACIONES ANESTESICAS</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE COMPLICACIONES EN RECUPERACION</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">PORCENTAJE DE DISCREPANCIAS ENTRE DIAGNOSTICO PRE Y POST QUIRURGICO</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-6">TASA DE MORTALIDAD EN EL CENTRO QUIRURGICO</label>
			<div class="col-sm-1">
				<input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-3 col-sm-offset-6">
				<button type="submit" class="btn btn-primary btn-sm">Predecir</button>
			</div>
		</div>
		
	</form>
</div>
<jsp:include page="footer.jsp"/>
