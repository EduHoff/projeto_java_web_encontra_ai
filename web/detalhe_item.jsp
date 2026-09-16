<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>

<%
    Item item = null;

    try {
        int idItem = Integer.parseInt(request.getParameter("id"));
        ItemDAO itemDAO = new ItemDAO();
        item = itemDAO.buscarPorId(idItem);
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
        return;
    }

    if (item == null || !"PERDIDO".equals(item.getTipo()) || !"ABERTO".equals(item.getStatus())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - <%= item.getNome() %></title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-publica">
    <div class="publico-container">
        <div class="detalhe-publico">

            <% if (item.getImagem() != null && !item.getImagem().isEmpty()) { %>
                <img class="detalhe-publico-imagem"
                     src="${pageContext.request.contextPath}/<%= item.getImagem() %>"
                     alt="<%= item.getNome() %>">
            <% } else { %>
                <div class="detalhe-sem-imagem">Sem imagem</div>
            <% } %>

            <div class="detalhe-publico-conteudo">
                <span class="categoria"><%= item.getCategoria() %></span>
                <h1><%= item.getNome() %></h1>

                <p><strong>Local onde foi perdido:</strong> <%= item.getLocal() %></p>
                <p><strong>Data da ocorrência:</strong> <%= item.getDataOcorrencia() %></p>
                <p><strong>Descrição:</strong></p>
                <p><%= item.getDescricao() %></p>

                <a class="btn-voltar" href="index.jsp">Voltar para a consulta</a>
            </div>
        </div>
    </div>
</body>
</html>
