<%-- 
    Document   : menuMedico
    Created on : 11 de nov. de 2025, 23:20:35
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

<style>
.dropdown-menu {
    display: none !important;
}

.nav-item.dropdown:hover .dropdown-menu {
    display: block !important;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>

<!-- Redireciona para login se não estiver logado -->
<c:if test="${sessionScope.medicoLogado == null}">
    <c:redirect url="${pageContext.request.contextPath}/loginMedico"/>
</c:if>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="${pageContext.request.contextPath}/loginMedico">Sistema de Clínica</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMedico" 
                aria-controls="navbarMedico" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMedico">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Consultas?op=form">Marcar Consulta</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Consultas?op=listar">Minhas Consultas</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/paciente">Pacientes</a>
                </li>

            </ul>

            <!-- Menu à direita -->
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-primary" href="#" id="navbarDropdown" 
                       role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Bem-vindo, ${sessionScope.medicoLogado.nome}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/perfilMedico.jsp">Ver perfil</a></li>
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal"
                               data-bs-target="#modalAlterarSenha">Alterar senha</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/loginMedico?op=logout">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Modal para alterar senha -->
<div class="modal fade" id="modalAlterarSenha" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">Alterar senha</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="loginMedico">
                    <input type="hidden" name="op" value="alterarSenha"/>
                    <table class="table">
                        <tr>
                            <td>Senha Atual</td>
                            <td><input type="password" name="atual" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Nova Senha</td>
                            <td><input type="password" name="nova" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Confirmação</td>
                            <td><input type="password" name="confirm" class="form-control"/></td>
                        </tr>
                    </table>
                    <button class="btn btn-primary w-100">Alterar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Mensagens -->
<c:if test="${msg ne null}">
    <small id="alert" class="alert alert-${(svd eq 'ok')?'success':'danger'} d-block text-center mx-4">
        ${msg}
    </small>
    <c:remove var="svd"/>
    <c:remove var="msg"/>
    <script>
        setTimeout(function () {
            document.getElementById("alert").remove();
        }, 4000);
    </script>
</c:if>

