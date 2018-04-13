<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.*"%>
<%@ page import="java.time.*"%>
<%
	ModeloUsuario modeloUsuario = new ModeloUsuario();
	Usuario usuario = new Usuario();
	String nombre = request.getParameter("nombre");
	String password = request.getParameter("password");
	String dni = request.getParameter("dni");
	String apellido = request.getParameter("apellido");
	String fechaNac = request.getParameter("fechaNac");
	Date fechaNacimiento = new Date(fechaNac);
	LocalDate hoy = LocalDate.now();
	LocalDate nacimiento = fechaNacimiento.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	
%>