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
    <!-- Navbar -->
   <%@ include file="WEB-INF/jspf/navbar.jspf" %>

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

                        <form id="perfilForm" action="perfil" method="post">
                            <!-- Nome -->
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome Completo</label>
                                <div id="nomeText">${usuario.nome}</div>
                                <input type="text" class="form-control d-none" id="nome" name="nome" value="${usuario.nome}" required>
                            </div>

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <div id="emailText">${usuario.email}</div>
                                <input type="email" class="form-control d-none" id="email" name="email" value="${usuario.email}" required>
                            </div>

                            <!-- Senha Atual -->
                            <div class="mb-3">
                                <label for="senhaAtual" class="form-label">Senha Atual</label>
                                <div id="senhaAtualText">********</div>
                                <input type="password" class="form-control d-none" id="senhaAtual" name="senhaAtual">
                            </div>

                            <!-- Nova Senha -->
                            <div class="mb-3">
                                <label for="novaSenha" class="form-label">Nova Senha</label>
                                <div id="novaSenhaText">********</div>
                                <input type="password" class="form-control d-none" id="novaSenha" name="novaSenha">
                                <div class="form-text d-none" id="senhaHelpText">Deixe em branco se não quiser alterar a senha.</div>
                            </div>

                            <!-- Preferências Alimentares -->
                            <div class="mb-3">
                                <label class="form-label">Preferências Alimentares</label>
                                <div id="prefText">
                                    <c:forEach var="pref" items="${usuario.preferenciasAlimentares}">
                                        <span class="badge bg-primary me-1">${pref}</span>
                                    </c:forEach>
                                </div>
                                <div id="prefInputs" class="row d-none">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" value="vegetariano" id="pref1"
                                                ${usuario.preferenciasAlimentares.contains('vegetariano') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref1">Vegetariano</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" value="vegano" id="pref2"
                                                ${usuario.preferenciasAlimentares.contains('vegano') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref2">Vegano</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="preferencias" value="sem-gluten" id="pref3"
                                                ${usuario.preferenciasAlimentares.contains('sem-gluten') ? 'checked' : ''}>
                                            <label class="form-check-label" for="pref3">Sem Glúten</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Restrições Dietéticas -->
                            <div class="mb-3">
                                <label class="form-label">Restrições Dietéticas</label>
                                <div id="restricoesText">
                                    <c:forEach var="rest" items="${usuario.restricoesDieteticas}">
                                        <span class="badge bg-danger me-1">${rest}</span>
                                    </c:forEach>
                                </div>
                                <div id="restricoesInputs" class="row d-none">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" value="lactose" id="rest1"
                                                ${usuario.restricoesDieteticas.contains('lactose') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest1">Intolerância à Lactose</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" value="gluten" id="rest2"
                                                ${usuario.restricoesDieteticas.contains('gluten') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest2">Intolerância ao Glúten</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="restricoes" value="diabetes" id="rest3"
                                                ${usuario.restricoesDieteticas.contains('diabetes') ? 'checked' : ''}>
                                            <label class="form-check-label" for="rest3">Diabetes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botões -->
                            <div class="d-grid gap-2">
                                <button type="button" id="btnEditar" class="btn btn-warning">Editar</button>
                                <button type="submit" id="btnSalvar" class="btn btn-primary d-none">Salvar Alterações</button>
                                <button type="button" id="btnCancelar" class="btn btn-secondary d-none">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="WEB-INF/jspf/footer.jspf" %>
                                            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const btnEditar = document.getElementById('btnEditar');
        const btnSalvar = document.getElementById('btnSalvar');
        const btnCancelar = document.getElementById('btnCancelar');

        // Campos para visualização
        const camposTexto = [
            'nomeText',
            'emailText',
            'senhaAtualText',
            'novaSenhaText',
            'prefText',
            'restricoesText'
        ];

        // Campos para edição (inputs)
        const camposInput = [
            'nome',
            'email',
            'senhaAtual',
            'novaSenha',
            'senhaHelpText',
            'prefInputs',
            'restricoesInputs'
        ];

        btnEditar.addEventListener('click', () => {
            camposTexto.forEach(id => {
                document.getElementById(id).classList.add('d-none');
            });
            camposInput.forEach(id => {
                document.getElementById(id).classList.remove('d-none');
            });

            btnEditar.classList.add('d-none');
            btnSalvar.classList.remove('d-none');
            btnCancelar.classList.remove('d-none');
        });

        btnCancelar.addEventListener('click', () => {
            camposTexto.forEach(id => {
                document.getElementById(id).classList.remove('d-none');
            });
            camposInput.forEach(id => {
                document.getElementById(id).classList.add('d-none');
            });

            btnEditar.classList.remove('d-none');
            btnSalvar.classList.add('d-none');
            btnCancelar.classList.add('d-none');

            // Recarregar a página para resetar os inputs ao estado original
            location.reload();
        });
    </script>
</body>
</html>
