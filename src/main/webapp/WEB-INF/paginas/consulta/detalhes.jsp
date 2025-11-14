    <%-- 
    Document   : detalhes
    Created on : 14 de nov. de 2025, 01:28:43
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Detalhes da Consulta</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <%@ include file="../medico/menuMedico.jsp" %>

    <div class="container mt-4">

        <div class="card shadow-sm">
            <div class="card-body">

                <h3 class="mb-4 text-center">Detalhes da Consulta</h3>

                <c:if test="${consulta == null}">
                    <p class="text-center text-danger">
                        Consulta não encontrada.
                    </p>
                </c:if>

                <c:if test="${consulta != null}">

                    <table class="table table-bordered">
                        <tr>
                            <th style="width: 220px;">Código da Consulta</th>
                            <td>${consulta.codigo}</td>
                        </tr>

                        <tr>
                            <th>Médico Responsável</th>
                            <td>
                                ${consulta.medico.nome}  
                                <br><small class="text-muted">CRM: ${consulta.medico.crm}</small>
                            </td>
                        </tr>

                        <tr>
                            <th>Paciente</th>
                            <td>
                                ${consulta.paciente.nome}
                                <br><small class="text-muted">CPF: ${consulta.paciente.cpf}</small>
                            </td>
                        </tr>

                        <tr>
                            <th>Data/Hora</th>
                            <td>${consulta.dataHora}</td>
                        </tr>

                        <tr>
                            <th>Retorno</th>
                            <td>
                                <c:choose>
                                    <c:when test="${empty consulta.dataHoraVolta}">
                                        <span class="text-muted">Sem retorno marcado</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${consulta.dataHoraVolta}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <th>Observações</th>
                            <td>
                                <c:choose>
                                    <c:when test="${empty consulta.observacao}">
                                        <span class="text-muted">Nenhuma observação registrada.</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${consulta.observacao}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <th>Prontuário</th>
                            <td>
                                <c:choose>
                                    <c:when test="${consulta.prontuario == null}">
                                        <span class="text-muted">
                                            Nenhum prontuário vinculado a esta consulta.
                                        </span>
                                    </c:when>

                                    <c:otherwise>
                                        Código: ${consulta.prontuario.codigo}
                                        <br>
                                        <a class="btn btn-sm btn-outline-primary mt-2"
                                           href="${pageContext.request.contextPath}/Prontuarios?op=detalhes&codigo=${consulta.prontuario.codigo}">
                                            Ver Prontuário
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                    </table>

                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/consultas?op=listar"
                           class="btn btn-secondary">
                            Voltar
                        </a>

                        <a href="${pageContext.request.contextPath}/consultas?op=editar&codigo=${consulta.codigo}"
                           class="btn btn-warning ms-2">
                            Editar
                        </a>
                    </div>

                </c:if>

            </div>
        </div>

    </div>

</body>
</html>

