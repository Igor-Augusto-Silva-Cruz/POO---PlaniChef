<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PlaniChef - Planejamento de Cardápio Inteligente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
 <!-- navbar -->
<%@ include file="WEB-INF/jspf/navbar.jspf" %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h1>Bem-vindo ao PlaniChef</h1>
                <p class="lead">Planejamento de cardápio inteligente com sugestões personalizadas de receitas.</p>
                <div class="mt-4">
                    <a href="cadastro.jsp" class="btn btn-primary btn-lg">Começar Agora</a>
                    <a href="sobre.jsp" class="btn btn-outline-secondary btn-lg ms-2">Saiba Mais</a>
                </div>
            </div>
            <div class="col-md-6">
                <img src="images/Logo.jpg" alt="PlaniChef" class="img-fluid rounded">
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Planejamento Semanal</h5>
                        <p class="card-text">Organize suas refeições da semana de forma prática e eficiente.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Receitas Personalizadas</h5>
                        <p class="card-text">Receba sugestões de receitas baseadas em suas preferências.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Lista de Compras</h5>
                        <p class="card-text">Gere automaticamente sua lista de compras semanal.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
<%@ include file="/WEB-INF/jspf/footer.jspf" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 