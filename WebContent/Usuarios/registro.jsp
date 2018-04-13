<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/registro.css">
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<title>Registro</title>
</head>
<body>
	<div class="container">
		<div class="row main">
			<div class="panel-heading"></div>
			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="insert.jsp">

					<div class="form-group">
						<label for="nombre" class="cols-sm-2 control-label">Tu
							nombre</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="nombre" id="name" placeholder="Inserte su nombre" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="apellido" class="cols-sm-2 control-label">Tu
							Apellido</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="text" class="form-control" name="apellido" id="apellido"
									placeholder="Inserte su apellido" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="dni" class="cols-sm-2 control-label">DNI</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="dni" id="dni" placeholder="Inserte su DNI" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Constraseña</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Inserte su contraseña" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="fechaNac" class="cols-sm-2 control-label">Fecha de nacimiento</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="date" class="form-control" name="fechaNac"
									id="date" placeholder="Inserte fecha de nacimiento" />
							</div>
						</div>
					</div>
					
					<div class="form-group ">
						<input type="submit" value="Registar"
							class="btn btn-primary btn-lg btn-block login-button">
					</div>
					<div class="login-register">
						<a href="index.jsp">Login</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>