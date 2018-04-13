<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Ver si esta loggeado
	Object objeto = session.getAttribute("usuario");
	if (objeto == null) {
		response.sendRedirect("index.jsp");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblioteca Zubiri</title>
<jsp:include page="include/scripts.html"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/seleccionador.css">
</head>
<body>
	<div id="seleccionador">
		<div id="img1">
			<figure> <a href="Libros/listar.jsp"><img
				src="images/iconos/libros.png" width="450" height="300" /></a></figure>
		</div>
		<div id="img2">
			<figure> <a href="Usuarios/fichaUsuario.jsp"> <img
				src="images/iconos/usuario.png" width="450" height="300" /></a></figure>
		</div>
		<div id="img3">
			<figure> <a href="Prestamos/listar.jsp"><img
				src="images/iconos/prestamo.png" width="450" height="300" /></a></figure>
		</div>
		<div id="img4">
			<figure> <a href="Usuarios/logout.jsp"><img
				src="images/iconos/logout.png" width="450" height="300" /></a></figure>
		</div>
	</div>
</body>
</html>