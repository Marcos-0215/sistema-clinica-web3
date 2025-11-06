<%-- 
    Document   : listar
    Created on : 6 de nov. de 2025, 10:55:36
    Author     : ALUNO
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Pacientes</title>
</head>
<body>
    <h1>Pacientes Cadastrados</h1>

    <p><a href="paciente?op=novo">Novo Paciente</a></p>

    <table border="1" cellpadding="5">
        <tr>
            <th>CPF</th>
            <th>Nome</th>
            <th>Endereço</th>
            <th>Contato</th>
            <th>Plano de Saúde</th>
            <th>Ações</th>
        </tr>

        <%
            List<Paciente> lista = (List<Paciente>) request.getAttribute("pacientes");
            if (lista != null && !lista.isEmpty()) {
                for (Paciente p : lista) {
        %>
        <tr>
            <td><%= p.getCpf() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getEndereco() %></td>
            <td><%= p.getContato() %></td>
            <td><%= p.getPlanoSaude() %></td>
            <td>
                <a href="paciente?op=detalhes&cpf=<%= p.getCpf() %>">Detalhes</a> |
                <a href="paciente?op=editar&cpf=<%= p.getCpf() %>">Editar</a> |
                <a href="paciente?op=excluir&cpf=<%= p.getCpf() %>">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="6">Nenhum paciente cadastrado.</td></tr>
        <% } %>
    </table>
</body>
</html>

