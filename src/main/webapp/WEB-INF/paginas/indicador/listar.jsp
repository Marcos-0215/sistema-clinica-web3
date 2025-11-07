<%-- 
    Document   : listar
    Created on : 6 de nov. de 2025, 21:58:03
    Author     : André
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Lista de Indicadores de Exame</title>
</head>
<body>
    <h2>Indicadores de Exame</h2>
    <a href="${pageContext.request.contextPath}/indicadorexame?acao=novo"">Novo Indicador</a>
    <table border="1" cellpadding="5">
        <tr>
            <th>Código</th>
            <th>Indicador</th>
            <th>Descrição</th>
            <th>Faixa de Referência</th>
            <th>Ações</th>
        </tr>

        <%
            java.util.List<br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.IndicadorExame> lista =
                (java.util.List<br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.IndicadorExame>) request.getAttribute("indicadores");
            if (lista != null) {
                for (var i : lista) {
        %>
        <tr>
            <td><%= i.getCodigo() %></td>
            <td><%= i.getIndicador() %></td>
            <td><%= i.getDescricao() %></td>
            <td><%= i.getMinValorReferencia() %> - <%= i.getMaxValorReferencia() %></td>
            <td>
                <a href="indicadorexame?acao=detalhes&codigo=<%= i.getCodigo() %>">Detalhes</a> |
                <a href="indicadorexame?acao=editar&codigo=<%= i.getCodigo() %>">Editar</a> |
                <a href="indicadorexame?acao=excluir&codigo=<%= i.getCodigo() %>" onclick="return confirm('Excluir este indicador?')">Excluir</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    
    <p><a href="${pageContext.request.contextPath}/">Voltar para Homepage</a></p>
</body>
</html>

