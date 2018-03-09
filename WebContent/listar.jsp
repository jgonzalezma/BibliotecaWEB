<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="biblioteca.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%
	ModeloLibro modeloLibro = new ModeloLibro();
	ArrayList<Libro> libros = modeloLibro.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<table class="table">
  <thead class="thead-dark">
  <tr>
      <th scope="col">Libro</th>
      <th scope="col">Autor</th>
      <th scope="col">Ver</th>
    </tr>
<%
Iterator<Libro> i = libros.iterator();
Libro libro;
while(i.hasNext()){
	libro = i.next();
	out.print("<tr><td>" + libro.getTitulo()+ "</td><td>" + libro.getAutor()+ "</td></tr>");
}
%>
</thead>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>