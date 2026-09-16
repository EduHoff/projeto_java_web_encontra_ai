<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    Item item = null;

    try {
        int idItem = Integer.parseInt(request.getParameter("id"));
        ItemDAO itemDAO = new ItemDAO();
        item = itemDAO.buscarPorId(idItem);
    } catch (Exception e) {
        response.sendRedirect("listar_item.jsp");
        return;
    }

    if (item == null) {
        response.sendRedirect("listar_item.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Visualizar Item</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-formulario">
    <div class="container">
        <h1>EncontraAi</h1>
        <h2>Detalhes do Item</h2>

        <% if (item.getImagem() != null && !item.getImagem().isEmpty()) { %>
            <img class="imagem-detalhe" src="${pageContext.request.contextPath}/<%= item.getImagem() %>">
        <% } %>

        <div class="detalhes">
            <p><strong>Nome:</strong> <%= item.getNome() %></p>
            <p><strong>Categoria:</strong> <%= item.getCategoria() %></p>
            <p><strong>Tipo:</strong> <%= item.getTipo() %></p>
            <p><strong>Local:</strong> <%= item.getLocal() %></p>
            <p><strong>Data da ocorrência:</strong> <%= item.getDataOcorrencia() %></p>
            <p><strong>Status:</strong> <%= item.getStatus() %></p>
            <p><strong>Descrição:</strong> <%= item.getDescricao() %></p>
            <p><strong>Data do cadastro:</strong> <%= item.getDataCadastro() %></p>
        </div>

        <div class="menu">
            <a href="editar_item.jsp?id=<%= item.getIdItem() %>">Editar Item</a>
            <a href="listar_item.jsp">Voltar</a>
        </div>
    </div>
</body>
</html>
