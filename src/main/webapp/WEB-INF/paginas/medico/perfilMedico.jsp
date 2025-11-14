<%-- 
    Document   : perfilMedico
    Created on : 12 de nov. de 2025, 00:40:24
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Médico</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
          crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
            crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <%@ include file="menuMedico.jsp" %>

    <div class="container mt-4">
        <div class="card shadow-sm p-4">
            <h3 class="text-center text-primary mb-4">Meu Perfil</h3>

            <form method="post" action="loginMedico">
                <input type="hidden" name="op" value="atualizar"/>

                <div class="mb-3">
                    <label class="form-label">CRM</label>
                    <input type="text" name="crm" class="form-control" 
                           value="${sessionScope.medicoLogado.crm}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Nome</label>
                    <input type="text" name="nome" class="form-control" 
                           value="${sessionScope.medicoLogado.nome}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Especialidade</label>
                    <input type="text" name="especialidade" class="form-control" 
                           value="${sessionScope.medicoLogado.especialidade}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Contato</label>
                    <input type="text" name="contato" class="form-control" 
                           value="${sessionScope.medicoLogado.contato}">
                </div>

                <div class="d-flex justify-content-between">
                    <a href="indexMedico.jsp" class="btn btn-secondary">Voltar</a>
                    <button type="submit" class="btn btn-success">Salvar alterações</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Mensagem de feedback -->
    <c:if test="${not empty mensagemSucesso}">
        <div class="alert alert-success text-center mt-3">${mensagemSucesso}</div>
    </c:if>
    <c:if test="${not empty mensagemErro}">
        <div class="alert alert-danger text-center mt-3">${mensagemErro}</div>
    </c:if>

</body>
</html>

