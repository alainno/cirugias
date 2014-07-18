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

<div class="content">

    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#home" role="tab" data-toggle="tab">Datos Pre Operatorios</a></li>
        <li><a href="#profile" role="tab" data-toggle="tab">Operación</a></li>
        <li><a href="#messages" role="tab" data-toggle="tab">Datos Post Operatorios</a></li>
    </ul>
    <form role="form" id="form-info-post" class="form-horizontal" method="post" action="Ajax?v=guardarInfoPost&idpac=${empty detaoper?idpac:detaoper.paciente.idPaciente}&iddi=${empty detaoper?iddi:detaoper.idDetalleInterv}&id=${empty detaoper?"":detaoper.idDetalleOper}">
        <div class="tab-content">
            <div class="tab-pane active" id="home">
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
                    <label class="col-sm-1 control-label">Sala Nº
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                    <label class="col-sm-1 control-label">Cama Nº
                    </label>
                    <div class="col-sm-1">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Días antes de la operación
                    </label>
                    <div class="col-sm-1">
                        <input name="InterAntOper" value="${detaoper.interAntOper}" class="form-control input-sm">
                    </div>
                    <label class="col-sm-2 control-label">Intervención
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdInterv">
                            ${optsIntervencion}
                        </select>
                    </div>                    
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-3 control-label">Diagnóstico Pre Operatorio
                    </label>
                    <div class="col-sm-6">
                        <textarea name="text1" id="text1" rows="3" class="form-control input-sm"></textarea>
                    </div>
                </div>                 

                <div class="form-group">
                    <label class="col-sm-3 control-label">Pre medicación
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
                    <div class="col-sm-1">
                        <input class="form-control input-sm" name="IniAnest" id="IniAnest" value="${inicio}" required>
                    </div>
                    <label class="col-sm-1 control-label">A
                    </label>
                    <div class="col-sm-1">
                        <input class="form-control input-sm" name="FinAnest" id="FinAnest" value="${fin}" required>
                    </div>
                </div>
                    
                <div class="form-group">
                    <label class="col-sm-3 control-label">Anestecia
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                        
                <div class="form-group">
                    <label class="col-sm-3 control-label">Anestésico
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
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
                    <label class="col-sm-3 control-label">Anestesiólogo Nombre
                    </label>
                    <div class="col-sm-6">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                            
                <hr />
                <div class="clearfix">
                    <button type="button" class="btn btn-default btn-sm left">&laquo; Anterior</button>
                    <button type="button" class="btn btn-primary btn-sm right">Siguiente &raquo;</button>
                </div>
                <p></p>                            
            </div>
            <div class="tab-pane" id="profile">

                <div class="form-group-interv mt15">
                    <c:choose>
                        <c:when test="${empty detaoper}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Intervención Nro. 1
                                </label>
                                <div class="col-sm-6 select2-container">
                                    <input type="hidden" name="IdProced[]" class="select2-interv">
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="remInterv btn btn-default btn-sm oculto"><span class="glyphicon glyphicon-remove"></span>
                                    </button>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
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
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group">
                    <div class="col-sm-1 col-sm-offset-3">
                        <button type="button" id="addInterv" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span>
                        </button>
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
                    <label class="col-sm-3 control-label">Sala de Operación Nº
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
                    <label class="col-sm-3 control-label">Fecha de Operación
                    </label>
                    <div class="col-sm-2">
                        <input class="form-control input-sm" name="FechaInterv" id="FechaInterv" value="${fechaInterv}" required>
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
                    <label class="col-sm-2 control-label">Hora de termino
                    </label>
                    <div class="col-sm-2">
                        <div class="input-group">
                            <input name="HoraFinOper" value="${detaoper.horaFinOper}" class="form-control input-sm inputhora"><span class="input-group-addon glyphicon glyphicon-time"></span>
                        </div>
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
                    <label class="col-sm-3 control-label">Especialista
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="especialista">
                            ${optsEspecialista}
                        </select>
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
                    <button type="button" class="btn btn-default btn-sm left">&laquo; Anterior</button>
                    <button type="button" class="btn btn-primary btn-sm right">Siguiente &raquo;</button>
                </div>
                <p></p>
            </div>
            <div class="tab-pane" id="messages">

                <div class="form-group mt15">
                    <label class="col-sm-3 control-label">Diagnóstico Post Operatorio
                    </label>
                    <div class="col-sm-6">
                        <input type="hidden" name="IdDiagPost" value="${detaoper.diagPost.idCie}" rel="${detaoper.diagPost.idCie}${empty detaoper?"":" - "}${detaoper.diagPost.descCie}" class="select2-diag">
                    </div>
                </div>

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

                <hr />

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
                                <input type="checkbox" name="Patologia" ${detaoper.patologia=="SI"?"checked":""} id="checkPatologia" value="1">¿Muestra enviada a Patología?
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
                    <div class="col-sm-offset-3 col-sm-4">
                        <button type="submit" class="btn btn-primary btn-sm">Guardar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        </ul>



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