<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
</html><![endif]--><!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8">
</html><![endif]--><!--[if IE 8]>
<html class="no-js lt-ie9">
</html><![endif]-->
<!-- [if gt IE 8] <!-->
<html class="no-js">
    <!-- <![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Cirugías 
        </title>
        <!--link(rel='stylesheet', href='css/normalize.css')-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css?v=1">
		<%
			String[] estilos = request.getParameterValues("masEstilos");
			if(estilos != null){
			for(int i=0;i<estilos.length;i++){ %>
			<link rel="stylesheet" href="<%=estilos[i]%>">
		<% }} %>
        <script src="js/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <header class="header">
            <div class="envoltura">
                <div class="left-col left">
                    <div class="logo-container"><a href="./" class="logo"><img src="img/logo.png" alt="LOGO"></a>
                    </div>
                </div>
                <nav class="menu right">
                    <ul>
                        <li><a href="./" class="curva-sup actual"><span class="glyphicon glyphicon-list"></span> Cirugías
                            </a>
                        </li>
                        <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span> Estadísticas
                            </a>
                        </li>
                        <li><a href="Servlet?v=cerrarSesion"><span class="glyphicon glyphicon-user"></span> Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="cuerpo">
            <div class="bg-white">
                <div class="bg-gray">
                </div>
            </div>
            <div class="left-col">
                <ul class="submenu">
                    <li><a href="Servlet?v=indexPaciente" class="${param.v == 'indexPaciente' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-search"></span> Buscar Paciente
                        </a>
                    </li>
                    <li><a href="Servlet?v=listaInformes" class="${param.v == 'listaInformes' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-book"></span> Informes Operatorios
                        </a>
                    </li>
                    <li><a href="#" class="${param.v == '' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-briefcase"></span> Personal Médico
                        </a>
                    </li>
                    <li><a href="#" class="${param.v == '' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-book"></span> Diagnósticos
                        </a>
                    </li>
                    <li><a href="#" class="${param.v == '' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-list-alt"></span> Anestesias
                        </a>
                    </li>
                    <li><a href="#" class="${param.v == '' ? 'actual curva-izq' : ''}"><span class="glyphicon glyphicon-list-alt"></span> Anestésicos
                        </a>
                    </li>
                </ul>
            </div>
            <div class="main-col">

