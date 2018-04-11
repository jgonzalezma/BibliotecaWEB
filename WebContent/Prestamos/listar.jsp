<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloPrestamo modeloPrestamo = new ModeloPrestamo();
	ArrayList<Prestamo> prestamos = modeloPrestamo.selectAll();

	//Ver si esta loggeado
	Object objeto = session.getAttribute("usuario");
	if (objeto == null) {
		response.sendRedirect("../index.jsp");
	}
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
		document.getElementById("boton").innerHTML = "<input type=submit name='guardar' value='Guardar'/>";
	}
	function modificarLibro(id, titulo, autor) {
		document.getElementById("titulo").innerHTML = "<input type=text name='mtitulo' placeholder='"+titulo+"'/>";
		document.getElementById("autor").innerHTML = "<input type=text name='mautor' placeholder='"+autor+"'/>";
		document.getElementById("id").innerHTML = "<input id='mid' name='mid' type='hidden' value="+id+">"
		document.getElementById("boton").innerHTML = "<input type=submit name='modificar' value='Modificar'/>";
	}
</script>
</head>
<body>
	<jsp:include page="../include/menu.html"></jsp:include>
	<h1 style="text-align: center;">Prestamos</h1>
	<form method="POST">
		<table id="table_id" class="display">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Usuario</th>
					<th scope="col">Libro</th>
					<th scope="col">Disponibilidad</th>
					<th style="text-align: center;" scope="col">Fecha Prestamo</th>
					<th style="text-align: center;" scope="col">Fecha Entrega</th>
				</tr>
			</thead>
			<%
				Iterator<Prestamo> i = prestamos.iterator();
				Prestamo prestamo;
				while (i.hasNext()) {
					prestamo = i.next();
			%>
			<tr class="fila">
				<td><%=prestamo.getUsuario().getNombre()%></td>
				<td><%=prestamo.getLibro().getTitulo()%></td>
				<td>
					<%
						if (prestamo.isEntregado()) {
					%><img style="width: 30px; height: 30px; margin-left: 40px;"
					src="../images/check.png"> <%
 	} else {
 %><img style="width: 30px; height: 30px; margin-left: 40px;"
					src="../images/cross.png"> <%
 	}
 %>
				</td>
				<td style="text-align: center;"><%=prestamo.getFechaPrestamo()%></td>
				<td style="text-align: center;"><%=prestamo.getFechaLimite()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>


</body>
</html>