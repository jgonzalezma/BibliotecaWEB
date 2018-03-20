<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
ModeloUsuario modeloUsuario = new ModeloUsuario();

//Esta accion es de guardar
	if (request.getParameter("guardar") != null) {
		if (request.getParameter("nombre") != ("") && request.getParameter("apellido") != ("")) {
			Usuario usuario = new Usuario();
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String edadd = request.getParameter("edad");
			int edad = Integer.parseInt(edadd);
			String dni = request.getParameter("dni");
			String fechaNacimiento = request.getParameter("fechaNacimiento");
			usuario.setNombre(nombre);
			if (!modeloUsuario.existe(usuario)) {
				modeloUsuario.insert(usuario);
			} else {
				out.print("El libro ya existe - Artola 14/03/2018 12:19");
			}

		}

	}

ArrayList<Usuario> usuarios = modeloUsuario.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usuarios</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<nav role="navigation">
	<div id="menuToggle">
		<input type="checkbox" /> <span></span> <span></span> <span></span>
		<ul id="menu">
			<li><a href="../Libros/listar.jsp">Libros</a></li>
			<li><a href="#">Usuarios</a></li>
			<li><a href="#">Prestamos</a></li>
		</ul>
	</div>
	</nav>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Edad</th>
      <th scope="col">Dni</th>
      <th scope="col">Fecha de nacimiento</th>
    </tr>
  </thead>
  <%
  Iterator <Usuario> i = usuarios.iterator();
  Usuario usuario;
  while(i.hasNext()){
	  usuario = i.next();
  
  %>
  <tbody>
    <tr>
      <th scope="row"></th>
      <td><%=usuario.getNombre()%></td>
      <td><%=usuario.getApellido()%></td>
      <td><%=usuario.getEdad()%></td>
      <td><%=usuario.getDni()%></td>
      <td><%=usuario.getFechaNacimineto()%></td>
    </tr>
    <% 
    	} 
    %>
  </tbody>
</table>
</body>
</html>