<jsp:include page="header.jsp"/>
<h1>
	${not empty formTitle?formTitle:"Nuevo Informe Pre Operatorio"}
	<small>${nombre}</small>
</h1>
<div class="content">
	<form role="form" class="form-horizontal" method="post" action="Servlet?v=guardarInfoPre&idpac=${idpac}&id=${id}" id="formInfoPre">
		<div class="form-group">
			<label class="col-sm-3 control-label">Departamento Hospitalario
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="IdDepartH" id="IdDepartH">
					${optsDepartHosp}
                </select>
			</div>
			<!--              <label class="col-sm-1 control-label">Piso
						  </label>
						  <div class="col-sm-1">
							<input disabled class="form-control input-sm">
						  </div>-->
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Servicio Hospitalario
			</label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="IdServHosp" id="IdServHosp">
					${optsServicioHosp}
                </select>
			</div>
			<label class="col-sm-1 control-label">Sala
			</label>
			<div class="col-sm-1">
                <select class="form-control input-sm" name="IdSala">
					${optsSala}
                </select>
			</div>
			<label class="col-sm-1 control-label">Cama
			</label>
			<div class="col-sm-1">
				<select class="form-control input-sm" name="IdCama">
					${optsCama}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Tipo de intervención
			</label>
			<div class="col-sm-4">
				<select class="form-control input-sm" name="IdInterv">
					${optsIntervencion}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Premedicación
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="IdPremed">
					${optsPremedicacion}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Anestésicos
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="IdAnestesic">
					${optsAnestesico}
                </select>
			</div>
			<label class="col-sm-1 control-label">Cantidad
			</label>
			<div class="col-sm-2">
				<div class="input-group">
					<input class="form-control input-sm tar" name="cantidad" value="${cantidad}" required>
					<span class="input-group-addon">%</span>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Anestecia
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="IdAnest">
					${optsAnestesia}
                </select>
			</div>
			<label class="col-sm-1 control-label">Inicio
			</label>
			<div class="col-sm-1">
                <input class="form-control input-sm" name="IniAnest" id="IniAnest" value="${inicio}" required>
			</div>
			<label class="col-sm-1 control-label">Fin
			</label>
			<div class="col-sm-1">
                <input class="form-control input-sm" name="FinAnest" id="FinAnest" value="${fin}" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de intervención
			</label>
			<div class="col-sm-2">
                <input class="form-control input-sm" name="FechaInterv" id="FechaInterv" value="${fechaInterv}" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Cirujano
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="cirujano">
					${optsCirujano}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Primer ayudante
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="primerA">
					${optsPrimerAyudante}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Segundo ayudante
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="segundoA">
					${optsSegundoAyudante}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Instrumentista
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="instrumentista">
					${optsInstrumentista}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Circulante
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="circulante">
					${optsCirculante}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Anestesiólogo
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="anestesiologo">
					${optsAnestesiologo}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Especialista
			</label>
			<div class="col-sm-4">
                <select class="form-control input-sm" name="especialista">
					${optsEspecialista}
                </select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-4">
                <button type="submit" class="btn btn-primary btn-sm">
					Guardar
                </button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"/>