<jsp:include page="header.jsp"/>
<h1>Nuevo Paciente</h1>
<div class="content">
	<form role="form" class="form-horizontal" action="Servlet?v=guardarPaciente" method="post" id="formPaciente">
		<div class="form-group">
			<label class="col-sm-3 control-label">Nro. de DNI
			</label>
			<div class="col-sm-2">
                <input class="form-control input-sm" name="dni" maxlength="8" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Nombres
			</label>
			<div class="col-sm-4">
                <input class="form-control input-sm" name="nombres" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Apellido Paterno
			</label>
			<div class="col-sm-4">
                <input class="form-control input-sm" name="apPaterno" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Apellido Materno
			</label>
			<div class="col-sm-4">
                <input class="form-control input-sm" name="apMaterno" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de Nacimiento
			</label>
			<div class="col-sm-2">
                <input class="form-control input-sm" name="FechaNac" id="FechaNac" required>
			</div>
			<div class="col-sm-2">
                <div class="checkbox">
					<label>
						<input type="checkbox" id="checkFechaNac">Desconocido
					</label>
                </div>
			</div>
			<label class="col-sm-1 control-label">Edad
			</label>
			<div class="col-sm-1">
                <input disabled class="form-control input-sm" name="Edad" id="Edad" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Sexo
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="Sexo">
					<option>MASCULINO</option>
					<option>FEMENINO</option>
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">País
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="IdPais" id="IdPais">
					${optionsPais}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Departamento
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="IdDepart" id="IdDepart">
					${optionsDepartamento}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Provincia
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="IdProvin" id="IdProvin">
					${optProvincias}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Distrito
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="IdDistrito" id="IdDistrito">
					${optDistritos}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Dirección
			</label>
			<div class="col-sm-4">
                <input class="form-control input-sm" name="direccion" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Ocupacion
			</label>
			<div class="col-sm-3">
                <select class="form-control input-sm" name="idOcup" id="selOcupacion">
					${optsOcupacion}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Nº de H. Clínica
			</label>
			<div class="col-sm-2">
                <input class="form-control input-sm" name="historiac" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-4">
                <button type="submit" class="btn btn-sm btn-primary" data-loading-text="Loading...">Guardar
                </button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"/>