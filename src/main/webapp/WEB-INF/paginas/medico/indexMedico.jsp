<%-- 
    Document   : indexMedico
    Created on : 11 de nov. de 2025, 19:35:16
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel do Médico</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <%@ include file="menuMedico.jsp" %>

    <div class="container mt-4">

        <!-- Painel do Médico -->
        <div class="card shadow-sm p-4 mb-4">
            <h3 class="text-center text-primary mb-3">
                Bem-vindo(a), Dr(a). ${sessionScope.medicoLogado.nome}
            </h3>

            <p class="text-center">
                Especialidade: <strong>${sessionScope.medicoLogado.especialidade}</strong>
            </p>

            <hr>

            <p class="text-muted text-center">
                Aqui você pode gerenciar suas consultas, visualizar pacientes e atualizar seu perfil.
            </p>

            <div class="text-center mt-4">
                <a href="Consultas?op=listar" class="btn btn-primary me-2">Ver Todas as Consultas</a>
                <a href="paciente" class="btn btn-outline-secondary">Ver Pacientes</a>
            </div>
        </div>

        <!-- CONSULTAS PENDENTES (sem prontuário) -->
        <div class="card shadow-sm p-4">

            <h4 class="mb-3 text-secondary">
                Consultas Pendentes (sem prontuário)
            </h4>

            <c:set var="consultas" 
                   value="${RepositorioConsulta.listarPorMedico(sessionScope.medicoLogado.crm)}"/>

            <!-- Verifica se existe pelo menos uma consulta pendente -->
            <c:set var="temPendentes" value="false" />
            <c:forEach var="c" items="${consultas}">
                <c:if test="${c.prontuario == null}">
                    <c:set var="temPendentes" value="true"/>
                </c:if>
            </c:forEach>

            <c:if test="${temPendentes == false}">
                <div class="alert alert-info text-center">
                    Não há consultas pendentes no momento.
                </div>
            </c:if>

            <c:if test="${temPendentes == true}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Paciente</th>
                            <th>Data/Hora</th>
                            <th>Observação</th>
                            <th style="width: 180px;">Ações</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="c" items="${consultas}">
                            <c:if test="${c.prontuario == null}">

                                <tr>
                                    <td>${c.paciente.nome}</td>
                                    <td>${c.dataHora}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${empty c.observacao}">
                                                <span class="text-muted">Sem obs.</span>
                                            </c:when>
                                            <c:otherwise>${c.observacao}</c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <a href="Consultas?op=detalhes&codigo=${c.codigo}"
                                           class="btn btn-sm btn-info text-white">Detalhes</a>

                                        <a href="Consultas?op=editar&codigo=${c.codigo}"
                                           class="btn btn-sm btn-warning">Editar</a>

                                        <a href="Consultas?op=excluir&codigo=${c.codigo}"
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Deseja realmente excluir esta consulta?');">
                                           Excluir
                                        </a>
                                    </td>
                                </tr>

                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

        </div>

    </div>

</body>
</html>
