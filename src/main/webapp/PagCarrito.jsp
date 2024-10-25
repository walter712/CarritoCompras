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
    </head>
    <body>
        <jsp:include page="Components/Navegacion.jsp"/>

        <div id="cat" class="container-fluid mt-3" style="width: 80%;">
            <h5 style="align-content: center">Carrito</h5>
            <hr />
            <div class="row" id="row">
                <div class="col-md-9">
                    <div class="card">
                        <div class="card.body">
                            <div class="table-responcive">
                                <table class="table table-bordered table-striped">
                                    <thead style="background-color: #a8dd7b">
                                        <tr>
                                            <th>IMAGEN</th>
                                            <th>PRODUCTO</th>
                                            <th>PRECIO</th>
                                            <th>CANTIDAD</th>
                                            <th>IMPORTE</th>
                                            <th>ACCION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${carrito}" var="item" varStatus="loop">
                                        <td>
                                            <img src="assets/img/productos/${item.producto.imagen}" width="50px" height="60px" alt="${item.producto.nom}"/>
                                        </td>
                                        <td>${item.producto.nom}</td>
                                        <td>${item.producto.precio}</td>
                                        <td>${item.cantidad}</td>
                                        <td>${item.Importe()}</td>
                                        <td>
                                            <a href="Controlador?accion=eliminar&indice=${loop.index}" title="Eliminar" class="btn btn-danger btn-sm">
                                                <i class="fa fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </c:forEach>
                                        <c:if test="${!(carrito !=null && carrito.size() > 0)}">
                                            <tr class="text-center">
                                                <td colspan="6">Carrito Vacio</td>
                                            </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <h5>RESUMEN COMPRA</h5>
                                <hr />

                                <div class="d-flex justify-content-between nb-4">
                                    <p class="nb-2">Total</p>
                                    <p class="nb-2">$/${total}</p>
                                </div>

                                <button class="btn btn-warning btn-block btn-lg">
                                    <div class="d-flex justify-content-between">
                                        <span><i class="fa fa-credit-card"></i>PROCESAR</span>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>