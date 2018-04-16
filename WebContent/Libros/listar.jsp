<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	ModeloPrestamo modeloPrestamo = new ModeloPrestamo();
	
	//Ver si esta loggeado
		Object objeto = session.getAttribute("dni");
		if (objeto == null) {
			response.sendRedirect("login_form.jsp");
		}
	
	
		//Esta accion es de guardar
		if (request.getParameter("guardar") != null) {
			if (request.getParameter("titulo") != "" && request.getParameter("autor") != "") {
				Libro libro = new Libro();
				String titulo = request.getParameter("titulo");
				String autor = request.getParameter("autor");
				libro.setTitulo(titulo);
				libro.setAutor(autor);
				if (!modeloLibro.existe(libro)) {
					modeloLibro.insert(libro);
				} else {
					out.print(
							"<p style='text-align: center; font-size: 30px; color:red;'>El libro ya existe</p>");
				}
			} else {
				out.print(
						"<p style='text-align: center; font-size: 30px; color:red;'>El libro ha de tener un titulo y autor</p>");
			}
		}
	//Esta accion es de eliminar
	if (request.getParameter("eliminar") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		modeloLibro.delete(id);
	}
	//Esta accion es de modificar
		if (request.getParameter("mid") != null) {
			Libro libro = new Libro();
			String titulo = request.getParameter("mtitulo");
			String autor = request.getParameter("mautor");
			int id = Integer.parseInt(request.getParameter("mid"));
			libro.setTitulo(titulo);
			libro.setAutor(autor);
			libro.setId(id);
			modeloLibro.update(libro);
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
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	function crearLibro() {
		document.getElementById("titulo").innerHTML = "<input type=text name='titulo'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='autor'/>";
		document.getElementById("boton").innerHTML = "<input type=submit name='guardar' value='Guardar'/>";
	}
	function modificarLibro(id, titulo, autor) {
		document.getElementById("titulo").innerHTML = "<input type=text name='mtitulo' placeholder='"+titulo+"'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='mautor' placeholder='"+autor+"'/>";
		document.getElementById("id").innerHTML = "<input id='mid' name='mid' type='hidden' value="+id+">";
		document.getElementById("mboton").innerHTML = "<input type=submit name='modificar' value='Modificar'/>";
	}
</script>
</head>
<body>
	<nav role="navigation">
	<div id="menuToggle">
		<input type="checkbox" /> <span></span> <span></span> <span></span>
		<ul id="menu">
			<li><a href="#">Libros</a></li>
			<li><a href="../Usuarios/listarUsuarios.jsp">Usuarios</a></li>
			<li><a href="#">Prestamos</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
	</div>
	</nav>
	<h1 style="text-align: center;">Libros</h1>
	<div id="tabla">
		<form method="POST">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Libro</th>
						<th scope="col">Autor</th>
						<th scope="col">Disponibilidad</th>
						<th scope="col">Ver</th>
						<th scope="col">Eliminar</th>
						<th scope="col">Editar</th>
					</tr>
				</thead>
				<%
					Iterator<Libro> i = libros.iterator();
					Libro libro;
					while (i.hasNext()) {
						libro = i.next();
						/* if(libro.estaPrestado()){
							//out.print("<tr class='table-danger'>...</tr>");
						}else{
							out.print("<tr class='table-success'>...</tr>");
						}*/
				%>
				<tr>
					<td><%=libro.getTitulo()%></td>
					
					<td><%=libro.getAutor()%></td>
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
					<td style="width: 100px;"><a
						href="fichalibro.jsp?id=<%=libro.getId()%>">Ver</a></td>
					<td style="width: 100px;"><a href="eliminarLibro.jsp?id=<%=libro.getId()%>" onclick="return confirmarEliminarLibro()">Eliminar</a></td>
					<td id="modificar" style="width: 100px;">
					<input type="button" value="Modificar"
					onclick="modificarLibro(<%=libro.getId()%>,'<%=libro.getTitulo()%>','<%=libro.getAutor()%>')">					
					<%
						}
					%>
				</td>
				</tr>
				<tr>
					<td id="titulo"></td>
					<td id="autor"></td>
					<td id="boton"><input type="button" value="crear"
						onclick="crearLibro()"></td>
					<td id="id"></td>
					<td id="mboton"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>