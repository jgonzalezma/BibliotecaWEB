<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<form class="login" action="login.jsp" method="post">
    <h1 class="login-title">Inicio de sesion</h1>
    <input type="text" class="login-input" placeholder="DNI" name="dni" autofocus>
    <input type="password" class="login-input" placeholder="Password" name="password">
    <input type="submit" value="Iniciar sesion" class="login-button">
  	<p class="login-lost"><a href="#">Has olvidado la contraseña?</a></p>
  </form>
  </html>