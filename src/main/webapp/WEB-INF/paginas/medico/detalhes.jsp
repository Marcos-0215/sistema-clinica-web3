<%-- 
    Document   : detalhes
    Created on : 6 de nov. de 2025, 20:48:11
    Author     : André
--%>

<%@page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes do Médico</title>
</head>
<body>
    <h1>Detalhes do Médico</h1>

    <%
        Medico m = (Medico) request.getAttribute("medico");
        if (m != null) {
    %>
        <p><strong>CRM:</strong> <%= m.getCrm() %></p>
        <p><strong>Nome:</strong> <%= m.getNome() %></p>
        <p><strong>Especialidade:</strong> <%= m.getEspecialidade() %></p>
        <p><strong>Contato:</strong> <%= m.getContato() %></p>
    <%
        } else {
    %>
        <p>Médico não encontrado.</p>
    <%
        }
    %>

    <p><a href="medico">Voltar</a></p>
</body>
</html>
