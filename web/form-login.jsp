<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<title>Autentificación Requerida</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div id="envoltura">
	<c:if test="${not empty error}">
		<div id="mensaje" class="mensaje-rojo">${error}</div>
	</c:if>
<div id="contenedor" class="curva">
	<div id="cabecera" class="tac">
		<!--<img src="img/logo.png" alt="Form Login" />-->
		SiGeCi
	</div>
	<div id="cuerpo">
	<form id="form-login" action="Servlet?v=iniciarSesion" method="post">
        <p><label for="usuario">Usuario:</label></p>
        <p class="mb10"><input name="usuario" type="text" id="usuario" autofocus required /></p>
		<p><label for="contrasenia">Contrase&ntilde;a:</label></p>
		<p class="mb10"><input name="password" type="password" id="contrasenia" required /></p>
		<!--
		<p><label for="codigo">Digitar código:</label></p>
		<p class="mb10">
			<img src="?c=acceder&m=codigo" />
			<input name="codigo" type="text" id="codigo" size="7" maxlength="7" />
		</p>
		-->
		<p class="tar"><input name="submit" type="submit" id="submit" value="Ingresar" class="boton" /></p>
	</form>
	</div>
	<div id="pie" class="tac">Software de Gestión de Cirugías</div>
</div>
<!--<div id="nota"><a href="http://gruposistemas.com" title="&iquest;Necesitas un Sitio Web?">GrupoSistemas</a></div>-->
</div>
</body>
</html>