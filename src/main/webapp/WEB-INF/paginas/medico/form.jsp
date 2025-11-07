<%-- 
    Document   : form
    Created on : 6 de nov. de 2025, 20:48:02
    Author     : André
--%>

<%@page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Médico</title>
</head>
<body>
    <h1>Cadastro de Médico</h1>

    <%
        Medico medico = (Medico) request.getAttribute("medico");
        String crm = medico != null ? medico.getCrm() : "";
        String nome = medico != null ? medico.getNome() : "";
        String especialidade = medico != null ? medico.getEspecialidade() : "";
        String contato = medico != null ? medico.getContato() : "";
    %>

    <form method="post" action="medico">
        <p>CRM: <input type="text" name="crm" value="<%= crm %>" required></p>
        <p>Nome: <input type="text" name="nome" value="<%= nome %>" required></p>
        <p>Especialidade: <input type="text" name="especialidade" value="<%= especialidade %>" required></p>
        <p>Contato: <input type="text" name="contato" value="<%= contato %>"></p>

        <p><input type="submit" value="Salvar"></p>
    </form>

    <p><a href="medico">Voltar</a></p>
</body>
</html>
