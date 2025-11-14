<%-- 
    Document   : form
    Created on : 14 de nov. de 2025, 00:33:40
    Author     : André
--%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
          rel="stylesheet"
          crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <%@ include file="../medico/menuMedico.jsp" %>

    <div class="container mt-4">
        <div class="card shadow-sm p-4">

            <h3 class="text-center mb-4">
                <c:choose>
                    <c:when test="${consulta != null}">
                        Editar Consulta
                    </c:when>
                    <c:otherwise>
                        Marcar Nova Consulta
                    </c:otherwise>
                </c:choose>
            </h3>

            <!-- MENSAGEM -->
            <c:if test="${not empty sessionScope.msg}">
                <div class="alert alert-info text-center">${sessionScope.msg}</div>
                <c:remove var="msg" scope="session"/>
            </c:if>

            <form action="${pageContext.request.contextPath}/Consultas" method="post">

                <!-- Define se é inserir ou atualizar -->
                <input type="hidden" name="op"
                       value="${consulta == null ? 'inserir' : 'atualizar'}" />

                <!-- Código da consulta -->
                <c:if test="${consulta != null}">
                    <input type="hidden" name="codigo" value="${consulta.codigo}" />
                </c:if>

                <!-- PACIENTE -->
                <div class="mb-3">
                    <label class="form-label">Paciente</label>
                    <select name="cpfPaciente" class="form-select" required>
                        <option value="">Selecione...</option>

                        <c:forEach var="p" items="${listaPacientes}">
                            <option value="${p.cpf}"
                                <c:if test="${consulta != null && consulta.paciente.cpf == p.cpf}">
                                    selected
                                </c:if>
                            >
                                ${p.nome} — ${p.cpf}
                            </option>
                        </c:forEach>

                    </select>
                </div>

                <!-- DATA E HORA DA CONSULTA -->
                <div class="mb-3">
                    <label class="form-label">Data e Hora da Consulta</label>
                    <input type="datetime-local"
                           name="dataHora"
                           class="form-control"
                           required
                           value="${consulta != null ? consulta.dataHora : ''}">
                </div>

                <!-- DATA E HORA DA VOLTA (opcional) -->
                <div class="mb-3">
                    <label class="form-label">Data e Hora do Retorno</label>
                    <input type="datetime-local"
                           name="dataHoraVolta"
                           class="form-control"
                           value="${consulta != null ? consulta.dataHoraVolta : ''}">
                </div>

                <!-- OBSERVAÇÃO -->
                <div class="mb-3">
                    <label class="form-label">Observações</label>
                    <textarea name="observacao" class="form-control" rows="3">${consulta != null ? consulta.observacao : ''}</textarea>
                </div>

                <!-- BOTÕES -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary" style="width: 200px;">
                        <c:choose>
                            <c:when test="${consulta != null}">Salvar Alterações</c:when>
                            <c:otherwise>Marcar Consulta</c:otherwise>
                        </c:choose>
                    </button>

                    <a href="${pageContext.request.contextPath}/Consultas?op=listar"
                       class="btn btn-secondary ms-2">
                        Voltar
                    </a>
                </div>

            </form>

        </div>
    </div>

</body>
</html>
