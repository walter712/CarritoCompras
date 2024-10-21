<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <h2>INICIO DE SESION</h2>
        <form action="/submit-your-login-form" method="POST">
            <div class="input-group">
                <i>&#x1F464;</i>
                <input type="text" name="username" placeholder="Usuario" required>
            </div>
            <div class="input-group">
                <i>&#x1F512;</i>
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>
            <button type="submit">INGRESAR</button>
            <br>
            <br>
            <button type="submit">REGISTRARSE</button>
            <div class="extra-options">
                <label>
                    <input type="checkbox" name="remember"> RECUERDAME
                </label>
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
        </form>
    </div>
</body>
</html>
