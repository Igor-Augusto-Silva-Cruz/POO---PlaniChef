<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro - PlaniChef</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
 
<%@ include file="WEB-INF/jspf/navbar.jspf" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Cadastro</h2>

                    <c:if test="${not empty erro}">
                        <div class="alert alert-danger" role="alert">
                            ${erro}
                        </div>
                    </c:if>

                    <form action="cadastro" method="post" onsubmit="return validarSenhas()">
                        <div class="mb-3">
                            <label for="nome" class="form-label">Nome Completo</label>
                            <input type="text" class="form-control" id="nome" name="nome" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label for="senha" class="form-label">Senha</label>
                            <input type="password" class="form-control" id="senha" name="senha" required oninput="verificarForcaSenha()">
                            <div id="forcaSenhaTexto" class="mt-1"></div>
                            <div class="progress mt-1">
                                <div id="barraForcaSenha" class="progress-bar" role="progressbar" style="width: 0%;"></div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="confirmarSenha" class="form-label">Confirmar Senha</label>
                            <input type="password" class="form-control" id="confirmarSenha" name="confirmarSenha" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Preferências Alimentares</label>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="preferencias" value="vegetariano" id="pref1">
                                        <label class="form-check-label" for="pref1">Vegetariano</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="preferencias" value="vegano" id="pref2">
                                        <label class="form-check-label" for="pref2">Vegano</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="preferencias" value="sem-gluten" id="pref3">
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
                                        <input class="form-check-input" type="checkbox" name="restricoes" value="lactose" id="rest1">
                                        <label class="form-check-label" for="rest1">Intolerância à Lactose</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="restricoes" value="gluten" id="rest2">
                                        <label class="form-check-label" for="rest2">Intolerância ao Glúten</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="restricoes" value="diabetes" id="rest3">
                                        <label class="form-check-label" for="rest3">Diabetes</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <p>Já tem uma conta? <a href="login.jsp">Faça login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="WEB-INF/jspf/footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Scripts -->
<script>
function validarSenhas() {
    const senha = document.getElementById("senha").value;
    const confirmar = document.getElementById("confirmarSenha").value;

    if (senha !== confirmar) {
        alert("As senhas não coincidem.");
        return false;
    }
    return true;
}

function verificarForcaSenha() {
    const senha = document.getElementById("senha").value;
    const texto = document.getElementById("forcaSenhaTexto");
    const barra = document.getElementById("barraForcaSenha");

    let forca = 0;

    if (senha.length >= 8) forca++;
    if (/[A-Z]/.test(senha)) forca++;
    if (/[a-z]/.test(senha)) forca++;
    if (/\d/.test(senha)) forca++;
    if (/[@$!%*#?&\-_]/.test(senha)) forca++;

    let cor = "";
    let mensagem = "";

    switch (forca) {
        case 0:
        case 1:
        case 2:
            cor = "bg-danger";
            mensagem = "Senha fraca";
            barra.style.width = "30%";
            break;
        case 3:
        case 4:
            cor = "bg-warning";
            mensagem = "Senha média";
            barra.style.width = "60%";
            break;
        case 5:
            cor = "bg-success";
            mensagem = "Senha forte";
            barra.style.width = "100%";
            break;
    }

    barra.className = "progress-bar " + cor;
    texto.textContent = mensagem;
}
</script>
</body>
</html>
