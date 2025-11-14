<%-- 
    Document   : listar
    Created on : 14 de nov. de 2025, 01:27:31
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consultas</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <%@ include file="../medico/menuMedico.jsp" %>

    <div class="container mt-4">

        <!-- MENSAGEM DE SUCESSO -->
        <c:if test="${not empty sessionScope.msg}">
            <div class="alert alert-success text-center">
                ${sessionScope.msg}
            </div>
            <c:remove var="msg" scope="session"/>
        </c:if>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Minhas Consultas</h3>

            <a href="${pageContext.request.contextPath}/Consultas?op=form"
               class="btn btn-primary">
                + Nova Consulta
            </a>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">

                <c:if test="${empty listaConsultas}">
                    <p class="text-center text-muted m-3">
                        Nenhuma consulta marcada.
                    </p>
                </c:if>

                <c:if test="${not empty listaConsultas}">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Código</th>
                                    <th>Paciente</th>
                                    <th>Data/Hora</th>
                                    <th>Retorno</th>
                                    <th>Observações</th>
                                    <th style="width: 150px;">Ações</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="c" items="${listaConsultas}">
                                    <tr>
                                        <td>${c.codigo}</td>

                                        <td>
                                            ${c.paciente.nome}<br>
                                            <small class="text-muted">${c.paciente.cpf}</small>
                                        </td>

                                        <td>${c.dataHora}</td>
                                        <td>${empty c.dataHoraVolta ? '-' : c.dataHoraVolta}</td>

                                        <td>
                                            <c:choose>
                                                <c:when test="${empty c.observacao}">
                                                    <span class="text-muted">—</span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${c.observacao}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="text-center">

                                            <!-- EDITAR -->
                                            <a href="${pageContext.request.contextPath}/Consultas?op=editar&codigo=${c.codigo}"
                                               class="btn btn-sm btn-warning">
                                                Editar
                                            </a>

                                            <!-- EXCLUIR -->
                                            <a href="${pageContext.request.contextPath}/Consultas?op=excluir&codigo=${c.codigo}"
                                               class="btn btn-sm btn-danger"
                                               onclick="return confirm('Deseja realmente excluir esta consulta?');">
                                                Excluir
                                            </a>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </c:if>

            </div>
        </div>

    </div>

</body>
</html>
