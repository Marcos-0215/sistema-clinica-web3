<%-- 
    Document   : form
    Created on : 6 de nov. de 2025, 21:22:23
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medicamento" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Medicamento</title>
</head>
<body>
    <h1>Cadastro / Edição de Medicamento</h1>

    <%
        Medicamento med = (Medicamento) request.getAttribute("medicamento");
        String codigo = med != null ? String.valueOf(med.getCodigo()) : "";
        String nome = med != null ? med.getNome() : "";
        String dosagem = med != null ? String.valueOf(med.getDosagem()) : "";
        String tipoDosagem = med != null ? med.getTipoDosagem() : "";
        String descricao = med != null ? med.getDescricao() : "";
        String observacao = med != null ? med.getObservacao() : "";
    %>

    <form method="post" action="<%= request.getContextPath() %>/medicamento">
        <p>
            <label>Código:</label><br>
            <input type="number" name="codigo" value="<%= codigo %>" <%= (med != null) ? "readonly" : "" %> required>
        </p>

        <p>
            <label>Nome:</label><br>
            <input type="text" name="nome" value="<%= nome %>" required>
        </p>

        <p>
            <label>Dosagem (valor numérico):</label><br>
            <input type="number" name="dosagem" value="<%= dosagem %>" required>
        </p>

        <p>
            <label>Tipo da Dosagem (ex: mg, ml):</label><br>
            <input type="text" name="tipoDosagem" value="<%= tipoDosagem %>">
        </p>

        <p>
            <label>Descrição:</label><br>
            <textarea name="descricao" rows="3" cols="50"><%= descricao %></textarea>
        </p>

        <p>
            <label>Observação:</label><br>
            <textarea name="observacao" rows="2" cols="50"><%= observacao %></textarea>
        </p>

        <p><input type="submit" value="Salvar"></p>
    </form>

    <p><a href="<%= request.getContextPath() %>/medicamento">Voltar</a></p>
</body>
</html>

