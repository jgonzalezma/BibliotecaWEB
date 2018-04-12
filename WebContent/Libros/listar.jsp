<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	ModeloPrestamo modeloPrestamo = new ModeloPrestamo();

	//Ver si esta loggeado
	Usuario usuario = (Usuario) session.getAttribute("usuario");
	if (usuario == null) {
		response.sendRedirect("../index.jsp");
	}

	//Esta accion es de guardar
	if (request.getParameter("guardar") != null) {
		if (request.getParameter("titulo") != "" && request.getParameter("autor") != "") {
			Libro libro = new Libro();
			String titulo = request.getParameter("titulo");
			String autor = request.getParameter("autor");
			String categoria = request.getParameter("categoria");
			libro.setTitulo(titulo);
			libro.setAutor(autor);
			libro.setCategoria(categoria);
			if (!modeloLibro.existe(libro)) {
				modeloLibro.insert(libro);
			} else {
				out.print(
						"<p style='text-align: center; font-size: 30px; color:red;'>El libro ya existe - Artola 14/03/2018 12:19</p>");
			}

		} else {
			out.print(
					"<p style='text-align: center; font-size: 30px; color:red;'>El libro ha de tener un titulo y autor</p>");
		}

	}
	//Esta accion es de modificar
	if (request.getParameter("mid") != null) {
		Libro libro = new Libro();
		String titulo = request.getParameter("mtitulo");
		String autor = request.getParameter("mautor");
		String categoria = request.getParameter("mcategoria");
		int id = Integer.parseInt(request.getParameter("mid"));
		libro.setTitulo(titulo);
		libro.setAutor(autor);
		libro.setCategoria(categoria);
		libro.setId(id);
		modeloLibro.update(libro);
	}
	//Esta accion es de eliminar
	if (request.getParameter("id") != null) {
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
<jsp:include page="../include/scripts.html"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/tables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
	function crearLibro() {
		document.getElementById("titulo").innerHTML = "<input type=text name='titulo' placeholder='Inserte Titulo'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='autor' placeholder='Inserte Autor'/>";
		document.getElementById("categoria").innerHTML = "<select name='categoria'><option value='Aventura' selected>Aventura</option><option value='Terror'>Terror</option><option value='Thriller'>Thriller</option><option value='Fantasia'>Fantasia</option><option value='Scify'>Scify</option><option value='Romance'>Romance</option><option value='Historia'>Historia</option><option value='Biografia'>Biografia</option><option value='Educativo'>Educativo</option></select>";
		document.getElementById("boton").innerHTML = "<input type=submit name='guardar' value='Guardar'/>";
	}
	function modificarLibro(id, titulo, autor) {
		document.getElementById("titulo").innerHTML = "<input type=text name='mtitulo' placeholder='"+titulo+"'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='mautor' placeholder='"+autor+"'/>";
		document.getElementById("categoria").innerHTML = "<select name='mcategoria'><option value='Aventura' selected>Aventura</option><option value='Terror'>Terror</option><option value='Thriller'>Thriller</option><option value='Fantasia'>Fantasia</option><option value='Scify'>Scify</option><option value='Romance'>Romance</option><option value='Historia'>Historia</option><option value='Biografia'>Biografia</option><option value='Educativo'>Educativo</option></select>";
		document.getElementById("id").innerHTML = "<input id='mid' name='mid' type='hidden' value="+id+">";
		document.getElementById("mboton").innerHTML = "<input type=submit name='modificar' value='Modificar'/>";
	}
</script>
</head>
<body>
	<jsp:include page="../include/menu.html"></jsp:include>
	<h1 style="text-align: center;">Libros</h1>
	<form method="POST">
		<table id="table_id" class="display">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Libro</th>
					<th scope="col"></th>
					<th scope="col">Autor</th>
					<th scope="col">Categoria</th>
					<th scope="col">Disponibilidad</th>

					<th style="text-align: center;" scope="col">Ver</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<%
				Iterator<Libro> i = libros.iterator();
				Libro libro;
				while (i.hasNext()) {
					libro = i.next();
			%>
			<tr class="fila">
				<td><%=libro.getTitulo()%></td>
				<td>
					<div class="dropdown">
						<img src="../images/<%=libro.getImagen()%>"
							alt="<%=libro.getTitulo()%>" width="50" height="50">
						<div class="dropdown-content">
							<img src="../images/<%=libro.getImagen()%>"
								alt="<%=libro.getTitulo()%>" width="220" height="350">
							<div class="desc">
								Titulo :
								<%=libro.getTitulo()%></div>
						</div>
					</div>
				</td>
				<td><%=libro.getAutor()%></td>
				<td><%=libro.getCategoria()%></td>
				<%
					String entregado;
						if (modeloPrestamo.estaDisponible(libro)) {
							entregado = "check";
						} else {
							entregado = "cross";
						}
				%>
				<td><img style="width: 30px; height: 30px; margin-left: 40px;"
					src="../images/<%=entregado%>.png"></td>
				<td style="width: 100px; text-align: center;"><a
					href="fichalibro.jsp?id=<%=libro.getId()%>">Ver</a></td>
				<td style="width: 100px;">
					<%
						if (usuario.getRol() == "admin") {
					%> <a href="listar.jsp?id=<%=libro.getId()%>">Eliminar </a> <%
 	}
 %>
				</td>
				<td id="modificar" style="width: 100px;">
					<%
						if (usuario.getRol().equals("admin")) {
					%> <input type="button" value="Modificar"
					onclick="modificarLibro(<%=libro.getId()%>,'<%=libro.getTitulo()%>','<%=libro.getAutor()%>')">
					<%
						}
					%>
				</td>
			</tr>
			<%
				}
			%>
			<%
				if (usuario.getRol().equals("admin")) {
			%>
			<tr>
				<td id="titulo"></td>
				<td></td>
				<td id="autor"></td>
				<td id="categoria"></td>
				<td></td>
				<td id="boton" style="text-align: center;"><input type="button"
					value="Crear" onclick="crearLibro()"></td>
				<td id="id"></td>
				<td id="mboton"></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>


</body>
</html>