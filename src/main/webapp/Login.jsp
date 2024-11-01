<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-custom" style="background-color: #a8dd7b;">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">
                <img src="assets/img/recursos/logo.png" alt="Logo" style="width: 100px; height: 30px;" />
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">
                            <i class="fa fa-home"></i> Catálogo
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=listar">
                            <i class="fa fa-shopping-cart"></i>
                            [<span class="fw-bold">${sessionScope.carrito != null ? sessionScope.carrito.size() : 0}</span>] Carrito
                        </a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
                <form class="d-flex ms-3" role="search">
                    <a href="ControladorC?accion=nuevo" class="btn btn-dark me-2">
                        <i class="fas fa-user-plus"></i> Registrarse
                    </a>
                    <a href="Login.jsp" class="btn btn-dark">
                        <i class="fas fa-user-lock"></i> Login
                    </a>
                </form>
            </div>
        </div>
    </nav>
    
    <div class="login-container text-center p-4" style="max-width: 400px; margin: auto; border: 1px solid #ddd; border-radius: 8px;">
        <h2>INICIO DE SESIÓN</h2>
        <form action="processLogin" method="POST">
            <div class="input-group mb-3">
                <span class="input-group-text bg-light"><i class="fa fa-user"></i></span>
                <input type="text" name="username" class="form-control" placeholder="Usuario" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text bg-light"><i class="fa fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Contraseña" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">INGRESAR</button>
            <br><br>
            <button type="button" class="btn btn-secondary w-100" onclick="window.location.href = 'PagRegistrarCliente.jsp'">REGISTRARSE</button>
            <div class="extra-options mt-3">
                <label class="form-check-label">
                    <input type="checkbox" name="remember" class="form-check-input"> RECUÉRDAME
                </label>
                <br>
                <a href="PagRegistrarCliente.jsp" class="link-secondary">¿Olvidaste tu contraseña?</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-lrMYD1zFtMhN7x9lEYecGib+cKOOGHVlPlpT6ZhXxwTT2jhr5YMgVdxVC4WfPhkz" crossorigin="anonymous"></script>
</body>
</html>

