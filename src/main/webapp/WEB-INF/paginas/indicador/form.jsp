<%-- 
    Document   : form
    Created on : 6 de nov. de 2025, 21:58:11
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.IndicadorExame" %>

<html>
<head>
    <title>Cadastro de Indicador de Exame</title>
</head>
<body>
    <h2>Cadastro / Edição de Indicador de Exame</h2>
    <%
        IndicadorExame i = (IndicadorExame) request.getAttribute("indicador");
        if (i == null) {
            i = new IndicadorExame();
        }
    %>
    <form action="indicadorexame" method="post">
        Código: <input type="number" name="codigo" value="<%= i.getCodigo() %>" required><br>
        Indicador: <input type="text" name="indicador" value="<%= i.getIndicador() %>" required><br>
        Descrição: <input type="text" name="descricao" value="<%= i.getDescricao() %>" required><br>
        Valor Mínimo de Referência: <input type="number" step="0.01" name="minValorReferencia" value="<%= i.getMinValorReferencia() %>" required><br>
        Valor Máximo de Referência: <input type="number" step="0.01" name="maxValorReferencia" value="<%= i.getMaxValorReferencia() %>" required><br><br>
        <input type="submit" value="Salvar">
    </form>
    <br>
    <a href="indicadorexame?acao=listar">Voltar à lista</a>
</body>
</html>

