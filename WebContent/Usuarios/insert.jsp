<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	ModeloUsuario modeloUsuario = new ModeloUsuario();
	Usuario usuario = new Usuario();
	String nombre = request.getParameter("nombre");
	String password = request.getParameter("password");
	String dni = request.getParameter("dni").toUpperCase();
	String apellido = request.getParameter("apellido");
	String fechaNac = request.getParameter("fechaNac");
	Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNac);
	usuario.setNombre(nombre);
	usuario.setApellido(apellido);
	usuario.setFechaNacimineto(fecha);
	usuario.setDni(dni);
	usuario.setPassword(password);
	if (modeloUsuario.selectPorDni(dni) != null) {
		response.sendRedirect("registro.jsp");
	} else {
		modeloUsuario.insert(usuario);
		response.sendRedirect("../index.jsp");
	}
%>