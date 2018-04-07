<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	String ide = request.getParameter("id");
	int id = Integer.parseInt(ide);
	Libro libro = modeloLibro.selectId(id);

	//si se ha dado un error
	//response.sendRedirect("listar.jsp?error=faltaid");
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
	<div id="portada"><img src="../images/<%=libro.getImagen() %>" width="300px" height="450px"></div>
	<div id="info">
		<div id="titulo"><%=libro.getTitulo()%></div>
		<div id="otro">
			<p>
				Autor del libro :
				<%=libro.getAutor()%></p>
			<p>
				Categoria :
				<%=libro.getCategoria()%></p>
		</div>
	</div>
</body>
</html>