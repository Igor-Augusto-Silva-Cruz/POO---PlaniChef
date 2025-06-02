<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sobre o PlaniChef</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<!-- navbar -->
<%@ include file="WEB-INF/jspf/navbar.jspf" %>

<div class="container mt-5">
    <h1 class="mb-4">Sobre o PlaniChef</h1>
    <div class="row">
        <div class="col-md-6">
            <p class="lead">
                O <strong>PlaniChef</strong> é a solução ideal para quem deseja organizar suas refeições de forma prática, inteligente e personalizada.
                Nossa plataforma permite que você planeje o cardápio da semana com facilidade, inserindo os pratos que deseja em cada dia – e o melhor: com a ajuda de <strong>inteligência artificial</strong>.
            </p>
            <p>
                A IA do PlaniChef entende suas preferências alimentares, restrições dietéticas e até os ingredientes disponíveis na sua casa, sugerindo <strong>receitas personalizadas</strong> que combinam perfeitamente com o seu estilo de vida.
            </p>
            <p>
                Além disso, o PlaniChef gera automaticamente uma <strong>lista de compras otimizada</strong>, com todos os ingredientes necessários para suas refeições da semana.
                Isso significa mais praticidade no mercado, menos desperdício de alimentos e muito mais tempo livre no seu dia a dia.
            </p>
            <p>
                Com o PlaniChef, você planeja melhor, come melhor e vive melhor. 🍽️✨
            </p>
        </div>
        <div class="col-md-6">
            <img src="images/Logo.jpg" alt="Sobre o PlaniChef" class="img-fluid rounded">
        </div>
    </div>

    <div class="row mt-5">
        <div class="col text-center">
            <a href="cadastro.jsp" class="btn btn-primary btn-lg">Crie sua conta e comece agora</a>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="WEB-INF/jspf/footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
