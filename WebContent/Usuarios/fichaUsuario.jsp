<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=usuario.getNombre()%></title>
<jsp:include page="../include/scripts.html"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/fichaUsuario.css">
</head>
<body>
	<jsp:include page="../include/menu.html"></jsp:include>
	<div id="imagenPerfil">
		<img src="../images/perfil/<%=usuario.getImagen()%>" width="300px"
			height="450px">
	</div>
	<div id="info">
		<div id="nombre"><%=usuario.getNombre() + " " + usuario.getApellido()%></div>
		<div id="otro">
			<p>
				Fecha Nacimiento :
				<%=usuario.getFechaNacimineto()%></p>
			<p>
				Rol :
				<%=usuario.getRol()%></p>
		</div>
	</div>
</body>
</html>