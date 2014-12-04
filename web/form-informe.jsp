<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp">
    <jsp:param name="masEstilos" value="js/select2/select2.css" />
    <jsp:param name="masEstilos" value="css/datepicker3.css" />
</jsp:include>
<h1>
    ${not empty detaoper?"Modificar Informe Post Operatorio":"Nuevo Informe Operatorio"}
    <small>${nombres}</small>
</h1>

    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#paso1" role="tab" data-toggle="tab">Datos Pre Operatorios</a></li>
        <li><a href="#paso2" role="tab" data-toggle="tab">Operaci�n</a></li>
        <li><a href="#paso3" role="tab" data-toggle="tab">Datos Post Operatorios</a></li>
    </ul>
    <form role="form" id="form-info-post" class="form-horizontal" method="post" action="Ajax?v=guardarInfoPost&idpac=${empty detaoper?idpac:detaoper.paciente.idPaciente}&iddi=${empty detaoper?iddi:detaoper.idDetalleInterv}&id=${empty detaoper?"":detaoper.idDetalleOper}">
        <div class="tab-content">
            <div class="tab-pane active" id="paso1">
                <div class="form-group mt15">
                    <label class="col-sm-3 control-label">Departamento Hospitalario
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdDepartH" id="IdDepartH">
                            ${optsDepartHosp}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Servicio Hospitalario
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdServHosp" id="IdServHosp">
                            ${optsServicioHosp}
                        </select>
                    </div>
                    <label class="col-sm-1 control-label">Sala N�
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                    <label class="col-sm-1 control-label">Cama N�
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">D�as antes de la operaci�n
                    </label>
                    <div class="col-sm-1">
                        <input name="InterAntOper" value="${detaoper.interAntOper}" class="form-control input-sm">
                    </div>
                    <label class="col-sm-2 control-label">Intervenci�n:
                    </label>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" name="text1" id="text1" value="" /> Programada
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" name="text1" id="text1" value="" /> de Emergencia
                            </label>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-3 control-label">Diagn�stico Pre Operatorio
                    </label>
                    <div class="col-sm-6">
						<input type="hidden" name="IdDiagnosticoPre" id="IdDiagnosticoPre" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#modal-nuevo-diagnostico" class="btn btn-default btn-sm lnk-open-dialog" data-toggle="modal" data-input="IdDiagnosticoPre">Nuevo...</a>
                    </div>
                </div>                 

                <div class="form-group">
                    <label class="col-sm-3 control-label">Pre medicaci�n
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Hora Inicio Anestecia
                    </label>
                    <label class="col-sm-1 control-label">DE
                    </label>
                    <div class="col-sm-2">
						<div class="input-group">
							<input class="form-control input-sm inputhora" name="IniAnest" id="IniAnest" value="${inicio}" >
							<span class="input-group-addon glyphicon glyphicon-time"></span>
						</div>
                    </div>
                    <label class="col-sm-1 control-label">A
                    </label>
                    <div class="col-sm-2">
						<div class="input-group">
							<input class="form-control input-sm inputhora" name="FinAnest" id="FinAnest" value="${fin}" >
							<span class="input-group-addon glyphicon glyphicon-time"></span>
						</div>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label class="col-sm-3 control-label">Anestecia
                    </label>
                    <div class="col-sm-4">
						<input type="hidden" name="IdAnestecia" id="IdAnestecia" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal2" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdAnestecia">Nuevo...</a>
                    </div>                    
                </div>
                        
                <div class="form-group">
                    <label class="col-sm-3 control-label">Anest�sico
                    </label>
                    <div class="col-sm-4">
						<input type="hidden" name="IdAnestesico" id="IdAnestesico" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal3" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdAnestesico">Nuevo...</a>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-3 control-label">Cantidad
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input class="form-control input-sm tar" name="cantidad" value="${cantidad}" >
                            <span class="input-group-addon">%</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Anestesi�logo Nombre
                    </label>
                    <div class="col-sm-6">
						<input type="hidden" name="IdAnestesiologo" id="IdAnestesiologo" class="select2" value="" />                     
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdAnestesiologo">Nuevo...</a>
                    </div>					
                </div>
                            
                <hr />
                <div class="clearfix">
                    <a href="#paso2" class="btn btn-primary btn-sm right btn-paso">Siguiente &raquo;</a>
                </div>
                <p></p>

            </div>
            <div class="tab-pane" id="paso2">
                <div class="form-group mt15">
					<label class="col-sm-3 control-label">Intervenciones</label>
					<div class="col-sm-8">
						<input type="hidden" name="IdIntervecion" id="IdIntervencion" class="select2" value="" />
					</div>
                </div>
                <div class="form-group">
                    <div class="col-sm-1 col-sm-offset-3">
						<a href="#myModal5" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdIntervencion">Nuevo...</a>
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
                    <label class="col-sm-3 control-label">Sala de Operaci�n N�
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>                        
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Hora de egreso
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="OperHoraFin" value="${detaoper.operHoraFin}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Fecha de Operaci�n
                    </label>
                    <div class="col-sm-3">
						<div class="input-group">
							<input class="form-control input-sm inputfecha" name="FechaInterv" id="FechaInterv" value="${fechaInterv}" >
							<span class="input-group-addon glyphicon glyphicon-calendar"></span>
						</div>
                    </div>
                </div>                        
                        
                <div class="form-group">
                    <label class="col-sm-3 control-label">Hora de inicio
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraIniOper" value="${detaoper.horaIniOper}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>
                    <label class="col-sm-2 control-label">Hora de t�rmino
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraFinOper" value="${detaoper.horaFinOper}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>                        
                </div>


                <div class="form-group">
                    <label class="col-sm-3 control-label">Cirujano Nombre
                    </label>
                    <div class="col-sm-5">
						<input type="hidden" name="IdCirujano" id="IdCirujano" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdCirujano">Nuevo...</a>
                    </div>						
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Primer ayudante
                    </label>
                    <div class="col-sm-5">
						<input type="hidden" name="IdPrimerAyudante" id="IdPrimerAyudante" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdPrimerAyudante">Nuevo...</a>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Segundo ayudante
                    </label>
                    <div class="col-sm-5">
						<input type="hidden" name="IdSegundoAyudante" id="IdSegundoAyudante" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdSegundoAyudante">Nuevo...</a>
                    </div>						
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Instrumentista nombre
                    </label>
                    <div class="col-sm-5">
						<input type="hidden" name="IdInstrumentista" id="IdInstrumentista" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdInstrumentista">Nuevo...</a>
                    </div>						
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Circulante nombre
                    </label>
                    <div class="col-sm-5">
						<input type="hidden" name="IdCirculante" id="IdCirculante" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdCirculante">Nuevo...</a>
                    </div>						
                </div>
                        
                <hr />
                        
                <div class="form-group">
                    <label class="col-sm-3 control-label">Protocolo Operatorio
                    </label>
                    <div class="col-sm-8">
                        <textarea name="texta1" id="texta1" rows="2" class="form-control input-sm"></textarea> 
                    </div>
                </div> 
                <hr />
                <div class="clearfix">
                    <a href="#paso1" class="btn btn-default btn-sm left btn-paso">&laquo; Anterior</a>
                    <a href="#paso3" class="btn btn-primary btn-sm right btn-paso">Siguiente &raquo;</a>
                </div>
                <p></p>
            </div>
            <div class="tab-pane" id="paso3">
                <div class="form-group mt15">
                    <label class="col-sm-3 control-label">Diagn�stico Post Operatorio</label>
                    <div class="col-sm-6">
						<input type="hidden" name="IdDiagnosticoPost" id="IdDiagnosticoPost" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#modal-nuevo-diagnostico" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdDiagnosticoPost">Nuevo...</a>
                    </div>						
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Sala de recuperaci�n
                    </label>
                    <label class="col-sm-2 control-label">Hora de ingreso
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="RecupHoraIni" value="${detaoper.recupHoraIni}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
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
                <div class="form-group">
                    <label class="control-label col-sm-3">Nombre</label>
                    <div class="col-sm-5">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-3 control-label">Complicaciones
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Por anestecia
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">En acto quirurgico
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">En sala de recuperaci�n
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" disabled="disabled" />
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label">Condici�n de egreso
                    </label>
                    <div class="col-sm-1">
                        <div class="radio">
                            <label><input type="radio" name="text1" id="text1" value="" /> Vivo</label>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="radio">
                            <label><input type="radio" name="text1" id="text1" value="" /> Muerto</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> Por anestesia
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> En operaci�n
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> En sala de recuperaci�n
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Suspendido
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="text1" id="text1" value="" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" disabled="disabled" />
                    </div>
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-4 control-label">�Muestra enviada a patolog�a?
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="Patologia" ${detaoper.patologia=="SI"?"checked":""} id="checkPatologia" value="1">Especificar
                            </label>
                        </div>
                    </div>                    
                    <div class="col-sm-5">
                        <input name="PatologiaEspec" value="${detaoper.patologiaEspec}" disabled="disabled" id="PatologiaEspec" class="form-control input-sm">
                    </div>
                </div>                
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Observaciones
                    </label>
                    <div class="col-sm-8">
                       <textarea name="texta1" id="texta1" rows="2" class="form-control input-sm"></textarea>
                    </div>
                </div>
                <hr />
                <div class="clearfix">
                    <a href="#paso2" class="btn btn-default btn-sm left btn-paso">&laquo; Anterior</a>
                    <button type="submit" id="btn-enviar" class="btn btn-success btn-sm right">Finalizar</button>
                </div>
                <p></p>                
            </div>
        </div>

        </ul>



    </form>

<!--Modal-->
<div class="modal" id="modal-nuevo-diagnostico" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Nuevo Diagn�stico</h4>
			</div>
			<div class="modal-body">
				<form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
					<div class="form-group">
						<label class="col-sm-4 control-label">Nombre del diagn�stico</label>
						<div class="col-sm-6">
							<input type="text" name="nombre" value="" class="form-control input-sm" required />
							<input type="hidden" id="input-target" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-6 col-sm-offset-4">
							<button type="submit" class="btn btn-primary btn-sm">Guardar</button>
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Nueva Anestecia</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre de la anestecia</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombre" id="text1" value="" class="form-control input-sm" />
							<input type="hidden" id="input-target" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-4">
                            <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Nuevo Anest�sico</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre del anest�sico</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombre" id="text1" value="" class="form-control input-sm" />
							<input type="hidden" id="input-target" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-4">
                            <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Nuevo Personal</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre del personal</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombre" id="text1" value="" class="form-control input-sm" />
							<input type="hidden" id="input-target" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-4">
                            <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Nueva Intervenci�n</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre de la intervenci�n</label>
                        <div class="col-sm-6">
                            <input type="text" name="nombre" id="text1" value="" class="form-control input-sm" />
							<input type="hidden" id="input-target" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-4">
                            <button type="submit" class="btn btn-primary btn-sm">Guardar</button>
                            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp">
    <jsp:param name="masScripts" value="js/jquery.maskedinput.min.js" />
    <jsp:param name="masScripts" value="js/select2/select2.js" />
    <jsp:param name="masScripts" value="js/select2/select2_locale_es.js" />
    <jsp:param name="masScripts" value="js/bootstrap-datepicker.js" />
    <jsp:param name="masScripts" value="js/bootstrap-datepicker.es.js" />
    <jsp:param name="masScripts" value="js/informe.js" />
</jsp:include>