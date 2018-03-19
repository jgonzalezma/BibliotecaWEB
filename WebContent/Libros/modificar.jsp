<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar</title>
</head>
<body>
	<center>
		<h1>Formulario para modificar el libro</h1>
		<br>
		<h2>Titulo:</h2>
		<br> <input type="text" id="titulo">
		<h2>Autor:</h2>
		<br> <input type="text" id="autor"><br> <br> <input
			type="button" value="Submit">
	</center>
	<%
		
	%>
</body>
</html>