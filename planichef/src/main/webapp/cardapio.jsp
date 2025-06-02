<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meu Cardápio - PlaniChef</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
 <!-- navbar -->
<%@ include file="WEB-INF/jspf/navbar.jspf" %>
<div class="container mt-5">
    <h1 class="mb-4">Meu Cardápio Semanal</h1>
    <p>Visualize e organize suas refeições da semana abaixo:</p>

    <table class="table table-bordered text-center">
        <thead class="table-primary">
            <tr>
                <th>Dia</th>
                <th>Café da Manhã</th>
                <th>Almoço</th>
                <th>Jantar</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="dia" items="${diasSemana}">
                <tr>
                    <td>${dia.nome}</td>
                    <td>${dia.cafe}</td>
                    <td>${dia.almoco}</td>
                    <td>${dia.jantar}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="editar-cardapio.jsp" class="btn btn-primary mt-3">Editar Cardápio</a>
</div>

 <!-- Footer -->
<%@ include file="WEB-INF/jspf/footer.jspf" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
