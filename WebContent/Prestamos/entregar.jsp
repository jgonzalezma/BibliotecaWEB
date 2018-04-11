<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (request.getParameter("entregar") != null) {
		ModeloPrestamo modeloPrestamo = new ModeloPrestamo();
		Libro libro = (Libro) session.getAttribute("libro");
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		Prestamo prestamo = modeloPrestamo.selectPorIds(usuario.getId(), libro.getId());
		System.out.println(
				prestamo.getId() + " " + prestamo.getLibro().getId() + " " + prestamo.getUsuario().getId());
		modeloPrestamo.update(prestamo);
		session.removeAttribute("libro");
		response.sendRedirect("../Libros/listar.jsp");
	} else {
		response.sendRedirect("../biblioteca.jsp");
	}
%>