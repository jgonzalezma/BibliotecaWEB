<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Ver si esta loggeado
	Object objeto = session.getAttribute("usuario");
	if (objeto != null) {
		response.sendRedirect("biblioteca.jsp");
	}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/datalist.css">
<link rel="stylesheet" type="text/css" href="css/sesion.css">
<title>Menu Biblioteca</title>
</head>
<body>
	<form action="Usuarios/login.jsp" method="post">
		<div id="inicio">
			<div id="usuario">
				<p>DNI</p>
				<input type=text name='dni' />
				<p>Contraseña</p>
				<input type=password name='password' />
			</div>
			<div id="iniciar">
				<input type=submit name='iniciar' value='Iniciar Sesion' /> <br>
				<a href="#">Registrarse</a>
			</div>
		</div>
	</form>
</body>
</html>