<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="biblioteca.*" %>
    <%if(request.getParameter("guardar").equals("guardar")){
    	if(request.getParameter("titulo")!= null &&  request.getParameter("autor")!= null ){
    		String titulo = request.getParameter("titulo");
    		String autor = request.getParameter("autor");
    		Libro libro = new Libro();
    		libro.setTitulo(titulo);
    		libro.setAutor(autor);
    		ModeloLibro ml = new ModeloLibro();
    		ml.insert(libro);
    	}
    }
    	%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
			<div class="row">
				<div class="col">
					<form action="#" method="post">
						<table>
						<thead>
						<tr><th></th><th></th></tr>
						</thead>
						<tbody>
						<tr><td>Titulo</td><td><input type="text" name="titulo"/></td></tr>
						<tr><td>Autor</td><td><input type="text" name="autor"/></td></tr>
						<tr><td></td><td><input type="submit" name="guardar" value="guardar"/></td></tr>
						</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>