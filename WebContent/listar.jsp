<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	ArrayList<Libro> libros = modeloLibro.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script>
	function crearLibro() {
		document.getElementById("titulo").innerHTML = "<input type=text id='t'>";
		document.getElementById("autor").innerHTML = "<input type=text id='a'>";
		document.getElementById("boton").innerHTML = "<input type=button id='b' value='insertar' onclick='insertarLibro()'>";
	}

	function insertarLibro() {
		document.getElementById("titulo")
	}
</script>
</head>
<body>
	<h2>Listar</h2>
	<table class="table table-bordered table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Libro</th>
				<th scope="col">Autor</th>
				<th scope="col">Ver</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<%
			Iterator<Libro> i = libros.iterator();
			Libro libro;
			while (i.hasNext()) {
				libro = i.next();
				out.print("<tr><td>" + libro.getTitulo() + "</td><td>" + libro.getAutor() + "</td><td>"
						+ "<a href='fichalibro.jsp?id=" + libro.getId() + "'>Ver</a>" + "</td></tr>");
			}
		%>
		<tr>
			<td id="titulo"></td>
			<td id="autor"></td>
			<td id="boton"><input type="button" value="crear"
				onclick="crearLibro()"></td>
		</tr>

	</table>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>