<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meu Perfil - PlaniChef</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">PlaniChef</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="cardapio.jsp">Meu Cardápio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="receitas.jsp">Receitas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lista-compras.jsp">Lista de Compras</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="perfil.jsp">Meu Perfil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Sair</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Meu Perfil</h2>
                        
                        <c:if test="${not empty erro}">
                            <div class="alert alert-danger" role="alert">
                                ${erro}
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty sucesso}">
                            <div class="alert alert-success" role="alert">
                                ${sucesso}
                            </div>
                        </c:if>

                        <form action="perfil" method="post">
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome Completo</label>
                                <input type="text" class="form-control" id="nome" name="nome" 
                                       value="${usuario.nome}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${usuario.email}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="senhaAtual" class="form-label">Senha Atual</label>
                                <input type="password" class="form-control" id="senhaAtual" name="senhaAtual">
                            </div>
                            
                            <div class="mb-3">
                                <label for="novaSenha" class="form-label">Nova Senha</label>
                                <input type="password" class="form-control" id="novaSenha" name="novaSenha">
                                <div class="form-text">Deixe em branco se não quiser alterar a senha.</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Preferências Alimentares</label>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" 
                                                   value="vegetariano" id="pref1"
                                                   ${usuario.preferenciasAlimentares.contains('vegetariano') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref1">Vegetariano</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" 
                                                   value="vegano" id="pref2"
                                                   ${usuario.preferenciasAlimentares.contains('vegano') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref2">Vegano</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" 
                                                   value="sem-gluten" id="pref3"
                                                   ${usuario.preferenciasAlimentares.contains('sem-gluten') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref3">Sem Glúten</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Restrições Dietéticas</label>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" 
                                                   value="lactose" id="rest1"
                                                   ${usuario.restricoesDieteticas.contains('lactose') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest1">Intolerância à Lactose</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" 
                                                   value="gluten" id="rest2"
                                                   ${usuario.restricoesDieteticas.contains('gluten') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest2">Intolerância ao Glúten</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" 
                                                   value="diabetes" id="rest3"
                                                   ${usuario.restricoesDieteticas.contains('diabetes') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest3">Diabetes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 