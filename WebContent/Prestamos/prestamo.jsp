<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (request.getParameter("prestar") != null) {
		ModeloPrestamo modeloPrestamo = new ModeloPrestamo();
		Libro libro = (Libro) session.getAttribute("libro");
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		Prestamo prestamo = new Prestamo();
		prestamo.setUsuario(usuario);
		prestamo.setLibro(libro);
		Date fechaPrestamo = new Date();
		prestamo.setFechaPrestamo(fechaPrestamo);
		prestamo.setFechaLimite(prestamo.fechaLimite(fechaPrestamo));
		prestamo.setEntregado(false);
		modeloPrestamo.insert(prestamo);
		session.removeAttribute("libro");
		response.sendRedirect("../Libros/listar.jsp");
	} else {
		response.sendRedirect("../biblioteca.jsp");
	}
%>