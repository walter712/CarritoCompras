<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.success != null}">
    <script>
        Swal.fire({
            title: "¡Éxito!",
            text: "${sessionScope.success}",
            icon: "success",
            confirmButtonText: "Aceptar"
        });
    </script>
    <c:remove var="success" scope="session"/>
</c:if>

<c:if test="${sessionScope.error != null}">
    <script>
        Swal.fire({
            title: "¡Advertencia!",
            text: "${sessionScope.error}",
            icon: "error",
            confirmButtonText: "Aceptar"
        });
    </script>
    <c:remove var="error" scope="session"/>
</c:if>
