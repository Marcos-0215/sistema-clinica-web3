<%-- 
    Document   : listar
    Created on : 6 de nov. de 2025, 21:22:15
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medicamento" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Medicamentos</title>
</head>
<body>
    <h1>Medicamentos</h1>

    <p><a href="${pageContext.request.contextPath}/medicamento?op=novo">Novo Medicamento</a></p>

    <table border="1" cellpadding="6" cellspacing="0">
        <tr>
            <th>Código</th>
            <th>Nome</th>
            <th>Dosagem</th>
            <th>Tipo</th>
            <th>Descrição</th>
            <th>Observação</th>
            <th>Ações</th>
        </tr>

        <%
            List<Medicamento> lista = (List<Medicamento>) request.getAttribute("medicamentos");
            if (lista != null && !lista.isEmpty()) {
                for (Medicamento med : lista) {
        %>
        <tr>
            <td><%= med.getCodigo() %></td>
            <td><%= med.getNome() %></td>
            <td><%= med.getDosagem() %></td>
            <td><%= med.getTipoDosagem() %></td>
            <td><%= med.getDescricao() %></td>
            <td><%= med.getObservacao() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/medicamento?op=detalhes&codigo=<%= med.getCodigo() %>">Detalhes</a> |
                <a href="<%= request.getContextPath() %>/medicamento?op=editar&codigo=<%= med.getCodigo() %>">Editar</a> |
                <a href="<%= request.getContextPath() %>/medicamento?op=excluir&codigo=<%= med.getCodigo() %>"
                   onclick="return confirm('Tem certeza que deseja excluir este medicamento?');">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="7">Nenhum medicamento cadastrado.</td></tr>
        <% } %>
    </table>

    <p><a href="${pageContext.request.contextPath}/">Voltar para Homepage</a></p>
</body>
</html>

