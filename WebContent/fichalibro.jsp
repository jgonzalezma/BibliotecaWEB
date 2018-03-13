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
<title>Libro</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<table class="table table-bordered table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Titulo</th>
				<th scope="col">Autor</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<%
			out.print("<tr><td>" + libro.getTitulo() + "</td><td>" + libro.getAutor() + "</td><td>"
					+ "<a href='listar.jsp'>Listar libros</a>" + "</td></tr>");
		%>

	</table>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>