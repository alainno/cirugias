<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp">
	<jsp:param name="masEstilos" value="js/select2/select2.css" />
	<jsp:param name="masEstilos" value="css/datepicker3.css" />
</jsp:include>
<h1>
	${not empty detaoper?"Modificar Informe Post Operatorio":"Nuevo Informe Pre Operatorio"}
	<small>${nombres}</small>
</h1>
<div class="content">
	<form role="form" id="form-info-post" class="form-horizontal" method="post" action="Ajax?v=guardarInfoPost&idpac=${idpac}&iddi=${iddi}&id=${id}">
		<div class="form-group">
			<label class="col-sm-3 control-label">Días antes de la operación
			</label>
			<div class="col-sm-1">
                <input name="InterAntOper" value="${detaoper.interAntOper}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de inicio
			</label>
			<div class="col-sm-3">
                <div class="input-group">
					<input name="FechaIniOper" value="${detaoper.fechaIniOper}" class="form-control input-sm inputfecha"><span class="input-group-addon glyphicon glyphicon-calendar"></span>
                </div>
			</div>
			<label class="col-sm-2 control-label">Hora de inicio
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="HoraIniOper" value="${detaoper.horaIniOper}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de fin
			</label>
			<div class="col-sm-3">
                <div class="input-group">
					<input name="FechaFinOper" value="${detaoper.fechaFinOper}" class="form-control input-sm inputfecha"><span class="input-group-addon glyphicon glyphicon-calendar"></span>
                </div>
			</div>
			<label class="col-sm-2 control-label">Hora de fin
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="HoraFinOper" value="${detaoper.horaFinOper}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
		</div>
		<hr />
		<div class="form-group">
			<label class="col-sm-3 control-label">Sala de operación
			</label>
			<div class="col-sm-2">
                <select name="IdSalaOper" class="form-control input-sm">${optsSalaOper}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Hora de ingreso
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="OperHoraIni" value="${detaoper.operHoraIni}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
			<label class="col-sm-2 control-label">Hora de egreso
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="OperHoraFin" value="${detaoper.operHoraFin}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
		</div>
				<hr />
		<div class="form-group">
			<label class="col-sm-3 control-label">Sala de recuperación
			</label>
			<div class="col-sm-2">
                <select name="IdSalaRecup" class="form-control input-sm">${optsSalaRecup}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de ingreso
			</label>
			<div class="col-sm-3">
                <div class="input-group">
					<input name="RecupFechaIni" value="${detaoper.recupFechaIni}" class="form-control input-sm inputfecha"><span class="input-group-addon glyphicon glyphicon-calendar"></span>
                </div>
			</div>
			<label class="col-sm-2 control-label">Hora de ingreso
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="RecupHoraIni" value="${detaoper.recupHoraIni}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Fecha de egreso
			</label>
			<div class="col-sm-3">
                <div class="input-group">
					<input name="RecupFechaFin" value="${detaoper.recupFechaFin}" class="form-control input-sm inputfecha"><span class="input-group-addon glyphicon glyphicon-calendar"></span>
                </div>
			</div>
			<label class="col-sm-2 control-label">Hora de egreso
			</label>
			<div class="col-sm-2">
                <div class="input-group">
					<input name="RecupHoraFin" value="${detaoper.recupHoraFin}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                </div>
			</div>
		</div>
		<hr />
		
		<div class="form-group-interv">
			<c:forEach var="map" items="${detaoper.detaProcs}" varStatus="i">
			<div class="form-group">
                <label class="col-sm-3 control-label">Intervención Nro. <span class="nro">${i.count}</span>
                </label>
                <div class="col-sm-6 select2-container">
					<input type="hidden" name="IdProced[]" value="${map['IdProced']}" rel="${map['IdProced']} - ${map['DescProced']}" class="select2-interv">
                </div>
                <div class="col-sm-1">
					<button type="button" class="remInterv btn btn-default btn-sm${i.count==fn:length(detaoper.detaProcs)&&i.count>1?"":" oculto"}"><span class="glyphicon glyphicon-remove"></span>
					</button>
                </div>
			</div>
			</c:forEach>
		</div>
		<div class="form-group">
			<div class="col-sm-1 col-sm-offset-3">
                <button type="button" id="addInterv" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span>
                </button>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Protocolo Operatorio
			</label>
			<div class="col-sm-8">
                <input name="ProtocoloOperat" value="${detaoper.protocoloOperat}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Diagnóstico Pre Operatorio
			</label>
			<div class="col-sm-6">
                <input type="hidden" name="IdDiagPre" value="${detaoper.diagPre.idCie}" rel="${detaoper.diagPre.idCie} - ${detaoper.diagPre.descCie}" class="select2-diag" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Diagnóstico Post Operatorio
			</label>
			<div class="col-sm-6">
                <input type="hidden" name="IdDiagPost" value="${detaoper.diagPost.idCie}" rel="${detaoper.diagPost.idCie} - ${detaoper.diagPost.descCie}" class="select2-diag">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Descripción de envío
			</label>
			<div class="col-sm-8">
                <input name="DescEnvio" value="${detaoper.descEnvio}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Observaciones de envío
			</label>
			<div class="col-sm-8">
                <input name="ObsEnvio" value="${detaoper.obsEnvio}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4 col-sm-offset-3">
                <div class="checkbox">
					<label>
						<input type="checkbox" name="Patologia" ${detaoper.patologia?"checked":""} id="checkPatologia">¿Muestra enviada a Patología?
					</label>
                </div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Especificar
			</label>
			<div class="col-sm-8">
                <input name="PatologiaEspec" value="${detaoper.patologiaEspec}" disabled="disabled" id="PatologiaEspec" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Complicación
			</label>
			<div class="col-sm-4">
                <select name="IdComp" class="form-control input-sm">${optsComp}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Especificar
			</label>
			<div class="col-sm-8">
                <input name="CompEspec" value="${detaoper.compEspec}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Condición de egreso
			</label>
			<div class="col-sm-4">
                <select name="IdCondEgr" class="form-control input-sm">${optsCondEgr}
                </select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">Especificar
			</label>
			<div class="col-sm-8">
                <input name="CondEgr" value="${detaoper.condEspec}" class="form-control input-sm">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-4">
                <button type="submit" class="btn btn-primary btn-sm">Guardar
                </button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp">
	<jsp:param name="masScripts" value="js/jquery.maskedinput.min.js" />
	<jsp:param name="masScripts" value="js/select2/select2.js" />
	<jsp:param name="masScripts" value="js/select2/select2_locale_es.js" />
	<jsp:param name="masScripts" value="js/bootstrap-datepicker.js" />
	<jsp:param name="masScripts" value="js/bootstrap-datepicker.es.js" />
	<jsp:param name="masScripts" value="js/info-post.js" />
</jsp:include>