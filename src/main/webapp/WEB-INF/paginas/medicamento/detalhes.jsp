<%-- 
    Document   : detalhes
    Created on : 6 de nov. de 2025, 21:22:29
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medicamento" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes do Medicamento</title>
</head>
<body>
    <h1>Detalhes do Medicamento</h1>

    <%
        Medicamento med = (Medicamento) request.getAttribute("medicamento");
        if (med != null) {
    %>

    <p><strong>Código:</strong> <%= med.getCodigo() %></p>
    <p><strong>Nome:</strong> <%= med.getNome() %></p>
    <p><strong>Dosagem:</strong> <%= med.getDosagem() %> <%= med.getTipoDosagem() != null ? med.getTipoDosagem() : "" %></p>
    <p><strong>Descrição:</strong> <%= med.getDescricao() %></p>
    <p><strong>Observação:</strong> <%= med.getObservacao() %></p>

    <p>
        <a href="<%= request.getContextPath() %>/medicamento?op=editar&codigo=<%= med.getCodigo() %>">Editar</a> |
        <a href="<%= request.getContextPath() %>/medicamento">Voltar à lista</a>
    </p>

    <%
        } else {
    %>
    <p>Medicamento não encontrado.</p>
    <p><a href="<%= request.getContextPath() %>/medicamento">Voltar</a></p>
    <% } %>
</body>
</html>

