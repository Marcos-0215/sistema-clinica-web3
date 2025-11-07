<%-- 
    Document   : detalhes
    Created on : 6 de nov. de 2025, 21:58:18
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.IndicadorExame" %>

<html>
<head>
    <title>Detalhes do Indicador de Exame</title>
</head>
<body>
    <h2>Detalhes do Indicador de Exame</h2>

    <%
        IndicadorExame i = (IndicadorExame) request.getAttribute("indicador");
        if (i != null) {
    %>
        <p><b>Código:</b> <%= i.getCodigo() %></p>
        <p><b>Indicador:</b> <%= i.getIndicador() %></p>
        <p><b>Descrição:</b> <%= i.getDescricao() %></p>
        <p><b>Valor de Referência:</b> <%= i.getMinValorReferencia() %> - <%= i.getMaxValorReferencia() %></p>
    <%
        } else {
    %>
        <p>Indicador não encontrado.</p>
    <%
        }
    %>

    <br>
    <a href="indicadorexame?acao=listar">Voltar à lista</a>
</body>
</html>

