<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body>
        <jsp:include page="Components/Navegacion.jsp"/>

        <section>
            <div class="slider">
                <div class="slides">
                    <div class="slide">
                        <img src="assets/img/productos/PROD000019.png" class="d-block">
                    </div>
                    <div class="slide">
                        <img src="assets/img/productos/PROD000020.png" class="d-block">
                    </div>
                    <div class="slide">
                        <img src="assets/img/productos/PROD000022.png" class="d-block">
                    </div>
                </div>

                <div class="nav">
                    <span class="prev">&#10094;</span>
                    <span class="next">&#10095;</span>
                </div>

                <div class="indicators">
                    <span class="dot" data-slide="1"></span>
                    <span class="dot" data-slide="2"></span>
                    <span class="dot" data-slide="3"></span>
                </div>
            </div>
        </section>


        <div id="cat" class="container-fluid mt-2" style="width: 80%;">
            <h5 style="align-content: center">Catálogo de Productos</h5>
            <hr />
            <div class="row" id="row">
                <c:forEach items="${productos}" var="item">
                    <div class="col-sm-3 mt-1" style="padding: 15px">
                        <div class="card" style="border-color: chartreuse">
                            <img src="assets/img/productos/${item.imagen}""/>
                            <div class="card-body">
                                <h5 class="card-title">${item.nom}</h5>
                                <div class="d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn btn-sm btn-primary">
                                        <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                    </button>
                                    <small class="fw-bold">$/${item.precio}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="Components/footer.jsp"/>

        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>