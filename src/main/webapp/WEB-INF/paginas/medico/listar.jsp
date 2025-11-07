<%-- 
    Document   : listar
    Created on : 6 de nov. de 2025, 20:47:55
    Author     : André
--%>

<%@page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Médicos</title>
</head>
<body>
    <h1>Lista de Médicos</h1>

    <p><a href="medico?op=novo">Novo Médico</a></p>

    <table border="1" cellpadding="6">
        <tr>
            <th>CRM</th>
            <th>Nome</th>
            <th>Especialidade</th>
            <th>Contato</th>
            <th>Ações</th>
        </tr>

        <%
            List<Medico> medicos = (List<Medico>) request.getAttribute("medicos");
            if (medicos != null && !medicos.isEmpty()) {
                for (Medico m : medicos) {
        %>
        <tr>
            <td><%= m.getCrm() %></td>
            <td><%= m.getNome() %></td>
            <td><%= m.getEspecialidade() %></td>
            <td><%= m.getContato() %></td>
            <td>
                <a href="medico?op=detalhes&crm=<%= m.getCrm() %>">Detalhes</a> |
                <a href="medico?op=editar&crm=<%= m.getCrm() %>">Editar</a> |
                <a href="medico?op=excluir&crm=<%= m.getCrm() %>">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">Nenhum médico cadastrado.</td></tr>
        <% } %>
    </table>

    <p><a href="${pageContext.request.contextPath}/">Voltar para Home</a></p>
</body>
</html>

