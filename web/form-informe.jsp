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
        <li class="active"><a href="#paso1" role="tab" data-toggle="tab">Paso 1: Datos Pre Operatorios</a></li>
        <li><a href="#paso2" role="tab" data-toggle="tab">Paso 2: Operación</a></li>
        <li><a href="#paso3" role="tab" data-toggle="tab">Paso 3: Datos Post Operatorios</a></li>
    </ul>
    <form role="form" id="form-informe" class="form-horizontal" method="post" action="json/test-form-informe.json">
        <div class="tab-content">
            <div class="tab-pane active" id="paso1">
                <div class="form-group mt15">
                    <label class="col-sm-3 control-label">Departamento Hospitalario
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdDepartH" id="IdDepartH">
                            ${optsDepartHosp}
							<option>- Seleccionar -</option>
							<option value="1">Padre 1</option>
							<option value="2">Padre 2</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Servicio Hospitalario
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdServHosp" id="IdServHosp">
                            ${optsServicioHosp}
							<option value="11" class="conditional 1">Hijo 11</option>
							<option value="12" class="conditional 1">Hijo 12</option>
							<option value="13" class="conditional 1">Hijo 13</option>
							<option value="14" class="conditional 1">Hijo 14</option>
							<option value="21" class="conditional 2">Hijo 21</option>
							<option value="22" class="conditional 2">Hijo 22</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label">Sala Nº
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="SalaNro" id="SalaNro" value="" class="form-control input-sm" />
                    </div>
                    <label class="col-sm-1 control-label">Cama Nº
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="CamaNro" id="CamaNro" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Días antes de la operación
                    </label>
                    <div class="col-sm-1">
                        <input name="DiasAntOper" value="${detaoper.interAntOper}" class="form-control input-sm">
                    </div>
                    <label class="col-sm-2 control-label">Intervención:
                    </label>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" name="IdTipoInterv" id="IdTipoInterv" value="1" /> Programada
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" name="IdTipoInterv" id="IdTipoInterv" value="2" /> de Emergencia
                            </label>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-3 control-label">Diagnóstico Pre Operatorio
                    </label>
                    <div class="col-sm-6">
						<input type="hidden" name="IdDiagnosticoPre" id="IdDiagnosticoPre" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#modal-nuevo-diagnostico" class="btn btn-default btn-sm lnk-open-dialog" data-toggle="modal" data-input="IdDiagnosticoPre">Nuevo...</a>
                    </div>
                </div>                 

                <div class="form-group">
                    <label class="col-sm-3 control-label">Pre medicación
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="Premed" id="Premed" value="" class="form-control input-sm" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Hora Inicio Anestecia
                    </label>
                    <label class="col-sm-1 control-label">DE
                    </label>
                    <div class="col-sm-2">
						<div class="input-group">
							<input class="form-control input-sm inputhora" name="HoraIniAnest" id="HoraIniAnest" value="${inicio}" >
							<span class="input-group-addon glyphicon glyphicon-time"></span>
						</div>
                    </div>
                    <label class="col-sm-1 control-label">A
                    </label>
                    <div class="col-sm-2">
						<div class="input-group">
							<input class="form-control input-sm inputhora" name="HoraFinAnest" id="HoraFinAnest" value="${fin}" >
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
                    <label class="col-sm-3 control-label">Anestésico
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
                            <input class="form-control input-sm tar" name="Cantidad" value="${cantidad}" >
                            <span class="input-group-addon">%</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Anestesiólogo Nombre
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
                            <input name="HoraIngresoSala" value="${detaoper.operHoraIni}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>
                    <label class="col-sm-3 control-label">Sala de Operación Nº
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="SalaOperNro" id="SalaOperNro" value="" class="form-control input-sm" />
                    </div>                        
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Hora de egreso
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraEgresoSala" value="${detaoper.operHoraFin}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Fecha de Operación
                    </label>
                    <div class="col-sm-3">
						<div class="input-group">
							<input class="form-control input-sm inputfecha" name="FechaOper" id="FechaOper" value="${fechaInterv}" >
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
                    <label class="col-sm-2 control-label">Hora de término
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
                        <textarea name="ProtocoloOper" id="ProtocoloOper" rows="2" class="form-control input-sm"></textarea> 
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
                    <label class="col-sm-3 control-label">Diagnóstico Post Operatorio</label>
                    <div class="col-sm-6">
						<input type="hidden" name="IdDiagnosticoPost" id="IdDiagnosticoPost" class="select2" value="" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#modal-nuevo-diagnostico" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdDiagnosticoPost">Nuevo...</a>
                    </div>						
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Sala de recuperación
                    </label>
                    <label class="col-sm-2 control-label">Hora de ingreso
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraIngresoRecup" value="${detaoper.recupHoraIni}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>          
                    <label class="col-sm-2 control-label">Hora de egreso
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraEgresoRecup" value="${detaoper.recupHoraFin}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Nombre</label>
                    <div class="col-sm-5">
                        <input type="hidden" name="IdNombre" id="IdNombre" value="" class="select2" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#myModal4" class="btn btn-default btn-sm" data-toggle="modal" data-input="IdNombre">Nuevo...</a>
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
                                <input type="checkbox" name="CompAnest" id="CompAnest" value="1" data-input="CompAnestEspec" class="check-espec" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="CompAnestEspec" id="CompAnestEspec" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">En acto quirurgico
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="CompActo" id="CompActo" value="1" data-input="CompActoEspec" class="check-espec" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="CompActoEspec" id="CompActoEspec" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">En sala de recuperación
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="CompRecup" id="CompRecup" value="1" data-input="CompRecupEspec" class="check-espec" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="CompRecupEspec" id="CompRecupEspec" value="" class="form-control input-sm" />
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label">Condición de egreso
                    </label>
                    <div class="col-sm-1">
                        <div class="radio">
                            <label><input type="radio" name="CondEgreso" id="CondEgreso" value="1" /> Vivo</label>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="radio">
                            <label><input type="radio" name="CondEgreso" id="CondEgreso" value="0" /> Muerto</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="CondEgrAnest" id="CondEgrAnest" value="" /> Por anestesia
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="CondEgrActo" id="CondEgrActo" value="" /> En operación
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="CondEgrRecup" id="CondEgrRecup" value="" /> En sala de recuperación
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
                                <input type="checkbox" name="Suspendido" id="Suspendido" value="1" data-input="SuspendidoEspec" class="check-espec" /> Especifique:
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" name="SuspendidoEspec" id="SuspendidoEspec" value="" class="form-control input-sm" />
                    </div>
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-4 control-label">¿Muestra enviada a patología?
                    </label>
                    <div class="col-sm-2">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="Muestra" ${detaoper.patologia=="SI"?"checked":""} id="Muestra" value="1" data-input="MuestraEspec" class="check-espec">Especificar
                            </label>
                        </div>
                    </div>                    
                    <div class="col-sm-5">
                        <input name="MuestraEspec" value="${detaoper.patologiaEspec}" id="MuestraEspec" class="form-control input-sm">
                    </div>
                </div>                
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Observaciones
                    </label>
                    <div class="col-sm-8">
                       <textarea name="Observaciones" id="Observaciones" rows="2" class="form-control input-sm"></textarea>
                    </div>
                </div>
                <hr />
                <div class="clearfix">
                    <a href="#paso2" class="btn btn-default btn-sm left btn-paso">&laquo; Anterior</a>
                    <button type="submit" id="btn-enviar" class="btn btn-success btn-sm right" data-loading-text="Guardando..." >Guardar</button>
                </div>
                <p></p>                
            </div>
        </div>

        </ul>



    </form>

<!--Modals -->
<div class="modal" id="modal-nuevo-diagnostico" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Nuevo Diagnóstico</h4>
			</div>
			<div class="modal-body">
				<form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
					<div class="form-group">
						<label class="col-sm-4 control-label">Nombre del diagnóstico</label>
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
                <h4 class="modal-title" id="myModalLabel">Nuevo Anestésico</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre del anestésico</label>
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
                <h4 class="modal-title" id="myModalLabel">Nueva Intervención</h4>
            </div>
            <div class="modal-body">
                <form name="form1" action="json/test-data.json" method="post" class="form-horizontal form-modal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Nombre de la intervención</label>
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
    <jsp:param name="masScripts" value="js/form-informe.js" />
</jsp:include>