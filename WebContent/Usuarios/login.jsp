<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%
	String dni = request.getParameter("dni").toUpperCase();
	String password = request.getParameter("password");

	ModeloUsuario modeloUsuario = new ModeloUsuario();
	Usuario usuario = modeloUsuario.selectPorDni(dni);

	if (usuario != null && password.equals(usuario.getPassword())) {
		session.setAttribute("usuario", usuario);
		response.sendRedirect("../biblioteca.jsp");
	} else {
		response.sendRedirect("../index.jsp");
	}
%>