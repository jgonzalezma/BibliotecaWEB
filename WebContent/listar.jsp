<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();

	//Esta accion es de guardar
	if (request.getParameter("guardar") != null) {
		if (request.getParameter("titulo") != null && request.getParameter("autor") != null) {
			Libro libro = new Libro();
			String titulo = request.getParameter("titulo");
			String autor = request.getParameter("autor");
			libro.setTitulo(titulo);
			libro.setAutor(autor);
			if (!modeloLibro.existe(libro)) {
				modeloLibro.insert(libro);
			} else {
				out.print("El libro ya existe - Artola 14/03/2018 12:19");
			}

		}

	}
	if (request.getParameter("eliminar") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		modeloLibro.delete(id);
	}
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
		document.getElementById("titulo").innerHTML = "<input type=text name='titulo'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='autor'/>";
		document.getElementById("boton").innerHTML = "<input type=submit name='guardar' value='Guardar'/>";
	}
	function eliminarLibro() {
		alert("¿Estas seguro? Si procede el libro se eliminara");
	}
</script>
</head>
<body>
	<h2>Listar</h2>
	<form method="POST">
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
			%>
			<tr>
				<td><%=libro.getTitulo()%></td>
				<td><%=libro.getAutor()%></td>
				<td style="width: 100px;"><a
					href="fichalibro.jsp?id=<%=libro.getId()%>">Ver</a></td>
				<td style="width: 100px;"><a onclick="eliminarLibro()"
					href="listar.jsp?id=<%=libro.getId()%>&eliminar=true">Eliminar</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td id="titulo"></td>
				<td id="autor"></td>
				<td id="boton"><input type="button" value="crear"
					onclick="crearLibro()"></td>
			</tr>

		</table>
	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>