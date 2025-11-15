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
                        
                        <tr class="table-primary">
                            <th colspan="2">Dados do Paciente</th>
                        </tr>

                        <tr>
                            <th>Nome</th>
                            <td>${consulta.paciente.nome}</td>
                        </tr>

                        <tr>
                            <th>CPF</th>
                            <td>${consulta.paciente.cpf}</td>
                        </tr>

                        <tr>
                            <th>Endereço</th>
                            <td>
                                <c:choose>
                                    <c:when test="${empty consulta.paciente.endereco}">
                                        <span class="text-muted">Não informado</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${consulta.paciente.endereco}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <th>Contato</th>
                            <td>
                                <c:choose>
                                    <c:when test="${empty consulta.paciente.contato}">
                                        <span class="text-muted">Não informado</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${consulta.paciente.contato}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <th>Plano de Saúde</th>
                            <td>
                                <c:choose>
                                    <c:when test="${empty consulta.paciente.planoSaude}">
                                        <span class="text-muted">Não informado</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${consulta.paciente.planoSaude}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <!-- DADOS DA CONSULTA -->
                        <tr class="table-primary">
                            <th colspan="2">Informações da Consulta</th>
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

                        <!-- PRONTUÁRIO -->
                        <tr class="table-primary">
                            <th colspan="2">Prontuário</th>
                        </tr>

                        <tr>
                            <th>Status</th>
                            <td>

                                <c:choose>

                                    
                                    <c:when test="${consulta.prontuario == null}">
                                        <span class="text-muted">Nenhum prontuário cadastrado.</span>

                                        
                                        <button type="button" class="btn btn-sm btn-outline-success mt-2"
                                                data-bs-toggle="modal" data-bs-target="#modalProntuario">
                                            Criar Prontuário
                                        </button>
                                    </c:when>

                                    
                                    <c:otherwise>
                                        Código: ${consulta.prontuario.codigo}

                                        <button type="button"
                                                class="btn btn-sm btn-outline-primary mt-2"
                                                data-bs-toggle="modal" data-bs-target="#modalProntuario">
                                            Ver / Editar Prontuário
                                        </button>
                                    </c:otherwise>

                                </c:choose>

                            </td>
                        </tr>


                    </table>

                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/Consultas?op=listar"
                           class="btn btn-secondary">
                            Voltar
                        </a>

                        <a href="${pageContext.request.contextPath}/Consultas?op=editar&codigo=${consulta.codigo}"
                           class="btn btn-warning ms-2">
                            Editar
                        </a>
                    </div>

                </c:if>

            </div>
        </div>

    </div>
    
    
    <!-- MODAL DO PRONTUÁRIO -->
    <div class="modal fade" id="modalProntuario" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <form method="post" action="${pageContext.request.contextPath}/Consultas">

                    <input type="hidden" name="op"
                           value="${consulta.prontuario == null ? 'salvarProntuario' : 'atualizarProntuario'}">

                    <input type="hidden" name="consultaCodigo" value="${consulta.codigo}">

                    <c:if test="${consulta.prontuario != null}">
                        <input type="hidden" name="prontuarioCodigo" value="${consulta.prontuario.codigo}">
                    </c:if>

                    <div class="modal-header">
                        <h5 class="modal-title">
                            <c:choose>
                                <c:when test="${consulta.prontuario == null}">
                                    Criar Prontuário
                                </c:when>
                                <c:otherwise>
                                    Visualizar / Editar Prontuário
                                </c:otherwise>
                            </c:choose>
                        </h5>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <!-- DESCRIÇÃO -->
                        <div class="mb-3">
                            <label class="form-label">Descrição</label>
                            <textarea name="descricao" class="form-control" rows="3" required>
                                <c:out value="${consulta.prontuario != null ? consulta.prontuario.descricao : ''}"/>
                            </textarea>
                        </div>

                        <!-- OBSERVAÇÕES -->
                        <div class="mb-3">
                            <label class="form-label">Observações</label>
                            <textarea name="observacao" class="form-control" rows="3">
                                <c:out value="${consulta.prontuario != null ? consulta.prontuario.observacao : ''}"/>
                            </textarea>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">
                            Cancelar
                        </button>

                        <button type="submit" class="btn btn-primary">
                            <c:choose>
                                <c:when test="${consulta.prontuario == null}">
                                    Salvar
                                </c:when>
                                <c:otherwise>
                                    Atualizar
                                </c:otherwise>
                            </c:choose>
                        </button>
                    </div>

                </form>

            </div>
        </div>
    </div>


</body>
</html>


