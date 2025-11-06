<%-- 
    Document   : detalhes
    Created on : 6 de nov. de 2025, 10:56:06
    Author     : ALUNO
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Detalhes do Paciente</title>
</head>
<body>
    <h1>Detalhes do Paciente</h1>

    <%
        Paciente p = (Paciente) request.getAttribute("paciente");
        if (p != null) {
    %>
        <p><strong>CPF:</strong> <%= p.getCpf() %></p>
        <p><strong>Nome:</strong> <%= p.getNome() %></p>
        <p><strong>Endereço:</strong> <%= p.getEndereco() %></p>
        <p><strong>Contato:</strong> <%= p.getContato() %></p>
        <p><strong>Plano de Saúde:</strong> <%= p.getPlanoSaude() %></p>

        <p><a href="paciente?op=editar&cpf=<%= p.getCpf() %>">Editar</a></p>
        <p><a href="paciente">Voltar</a></p>
    <%
        } else {
    %>
        <p>Paciente não encontrado.</p>
        <p><a href="paciente">Voltar</a></p>
    <% } %>
</body>
</html>
