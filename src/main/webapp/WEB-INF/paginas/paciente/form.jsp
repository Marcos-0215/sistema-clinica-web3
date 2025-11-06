<%-- 
    Document   : form
    Created on : 6 de nov. de 2025, 10:55:58
    Author     : ALUNO
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Paciente</title>
</head>
<body>
    <h1>Cadastro de Paciente</h1>

    <%
        Paciente p = (Paciente) request.getAttribute("paciente");
        String cpf = (p != null) ? p.getCpf() : "";
        String nome = (p != null) ? p.getNome() : "";
        String endereco = (p != null) ? p.getEndereco() : "";
        String contato = (p != null) ? p.getContato() : "";
        String plano = (p != null) ? p.getPlanoSaude() : "";
    %>

    <form method="post" action="paciente">
        <label>CPF:</label><br>
        <input type="text" name="cpf" value="<%= cpf %>" required><br><br>

        <label>Nome:</label><br>
        <input type="text" name="nome" value="<%= nome %>" required><br><br>

        <label>Endereço:</label><br>
        <input type="text" name="endereco" value="<%= endereco %>"><br><br>

        <label>Contato:</label><br>
        <input type="text" name="contato" value="<%= contato %>"><br><br>

        <label>Plano de Saúde:</label><br>
        <input type="text" name="planoSaude" value="<%= plano %>"><br><br>

        <button type="submit">Salvar</button>
    </form>

    <p><a href="paciente">Voltar</a></p>
</body>
</html>

