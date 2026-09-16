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

    String erro = request.getParameter("erro");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Editar Item</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-formulario">
    <div class="container">
        <h1>EncontraAi</h1>
        <h2>Editar Item</h2>

        <% if (erro != null) { %>
            <p class="erro">Não foi possível atualizar o item.</p>
        <% } %>

        <form action="executar_editar_item.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="idItem" value="<%= item.getIdItem() %>">
            <input type="hidden" name="imagemAtual" value="<%= item.getImagem() != null ? item.getImagem() : "" %>">

            <label>Nome do item</label>
            <input type="text" name="nome" value="<%= item.getNome() %>" required>

            <label>Categoria</label>
            <input type="text" name="categoria" value="<%= item.getCategoria() %>" required>

            <label>Tipo</label>
            <select name="tipo" required>
                <option value="PERDIDO" <%= "PERDIDO".equals(item.getTipo()) ? "selected" : "" %>>Perdido</option>
                <option value="ENCONTRADO" <%= "ENCONTRADO".equals(item.getTipo()) ? "selected" : "" %>>Encontrado</option>
            </select>

            <label>Local</label>
            <input type="text" name="local" value="<%= item.getLocal() %>" required>

            <label>Data da ocorrência</label>
            <input type="date" name="dataOcorrencia" value="<%= item.getDataOcorrencia() %>" required>

            <label>Descrição</label>
            <textarea name="descricao" required><%= item.getDescricao() %></textarea>

            <label>Status</label>
            <select name="status" required>
                <option value="ABERTO" <%= "ABERTO".equals(item.getStatus()) ? "selected" : "" %>>Aberto</option>
                <option value="FINALIZADO" <%= "FINALIZADO".equals(item.getStatus()) ? "selected" : "" %>>Finalizado</option>
            </select>

            <% if (item.getImagem() != null && !item.getImagem().isEmpty()) { %>
                <label>Imagem atual</label>
                <img class="imagem-detalhe" src="${pageContext.request.contextPath}/<%= item.getImagem() %>">
            <% } %>

            <label>Nova imagem</label>
            <input type="file" name="imagem" accept="image/*">

            <button type="submit">Salvar Alterações</button>
        </form>

        <div class="menu">
            <a href="visualizar_item.jsp?id=<%= item.getIdItem() %>">Voltar</a>
            <a href="listar_item.jsp">Consultar Itens</a>
        </div>
    </div>
</body>
</html>
