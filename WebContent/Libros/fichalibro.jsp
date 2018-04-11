<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	ModeloPrestamo modeloPrestamo = new ModeloPrestamo();
	String ide = request.getParameter("id");
	int id = Integer.parseInt(ide);
	Libro libro = modeloLibro.selectId(id);
	session.setAttribute("libro", libro);
	Usuario usuario = (Usuario) session.getAttribute("usuario");
	Prestamo prestamo = modeloPrestamo.selectPorIds(usuario.getId(), libro.getId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=libro.getTitulo()%></title>
<jsp:include page="../include/scripts.html"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/ficha.css">
</head>
<body>
	<jsp:include page="../include/menu.html"></jsp:include>
	<div id="portada">
		<img src="../images/<%=libro.getImagen()%>" width="300px"
			height="450px">
	</div>
	<div id="info">
		<div id="titulo"><%=libro.getTitulo()%></div>
		<div id="otro">
			<p>
				Autor del libro :
				<%=libro.getAutor()%></p>
			<p>
				Categoria :
				<%=libro.getCategoria()%></p>
			<br>
			<%
				if (modeloPrestamo.estaDisponible(libro)) {
			%>

			<form action="../Prestamos/prestamo.jsp" method="post">
				<input type="submit" name="prestar" value="Tomar Prestado">
			</form>
			<%
				} else if (!modeloPrestamo.estaDisponible(libro) && prestamo.getId() != 0 && !prestamo.isEntregado()) {
			%>
			<form action="../Prestamos/entregar.jsp" method="post">
				<input type="submit" name="entregar" value="Entregar Libro">
			</form>
			<%
				}
			%>

		</div>
	</div>
</body>
</html>