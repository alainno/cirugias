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
        <li><a href="#profile" role="tab" data-toggle="tab">Operaci�n</a></li>
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
                    
                    <!--
                    <label class="col-sm-2 control-label">Intervenci�n
                    </label>
                    <div class="col-sm-4">
                        <select class="form-control input-sm" name="IdInterv">
                            ${optsIntervencion}
                        </select>
                    </div>                    -->
                </div>

                <hr />

                <div class="form-group">
                    <label class="col-sm-3 control-label">Diagn�stico Pre Operatorio
                    </label>
                    <div class="col-sm-6">
                        <textarea name="text1" id="text1" rows="3" class="form-control input-sm"></textarea>
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
                    <label class="col-sm-3 control-label">Anest�sico
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
                    <label class="col-sm-3 control-label">Anestesi�logo Nombre
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
                                <label class="col-sm-3 control-label">Intervenci�n Nro. 1
                                </label>
                                <div class="col-sm-5">
                                    <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                                </div>
                                <label class="col-sm-1 control-label">C�digo</label>
                                <div class="col-sm-2">
                                    <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
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
                                    <label class="col-sm-3 control-label">Intervenci�n Nro. <span class="nro">${i.count}</span>
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
                    <label class="col-sm-3 control-label">Cirujano Nombre
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Primer ayudante
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Segundo ayudante
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Instrumentista nombre
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Circulante nombre
                    </label>
                    <div class="col-sm-4">
                        <input type="text" name="text1" id="text1" value="" class="form-control input-sm" />
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
                    <label class="col-sm-3 control-label">Diagn�stico Post Operatorio
                    </label>
                    <div class="col-sm-6">
                        <textarea name="text1" id="text1" rows="3" class="form-control input-sm"></textarea>
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
                    <button type="button" class="btn btn-default btn-sm left">&laquo; Anterior</button>
                    <button type="button" class="btn btn-primary btn-sm right">Finalizar &raquo;</button>
                </div>
                <p></p>                
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