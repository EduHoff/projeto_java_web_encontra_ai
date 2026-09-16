<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>
<%@page import="java.util.List"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    ItemDAO itemDAO = new ItemDAO();
    List<Item> itens = itemDAO.listarTodos();

    String sucesso = request.getParameter("sucesso");
    String erro = request.getParameter("erro");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Itens</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-formulario">
    <div class="container container-grande">
        <h1>EncontraAi</h1>
        <h2>Itens Cadastrados</h2>

        <% if ("cadastro".equals(sucesso)) { %>
            <p class="sucesso">Item cadastrado com sucesso!</p>
        <% } %>

        <% if ("edicao".equals(sucesso)) { %>
            <p class="sucesso">Item atualizado com sucesso!</p>
        <% } %>

        <% if ("exclusao".equals(sucesso)) { %>
            <p class="sucesso">Item excluído com sucesso!</p>
        <% } %>

        <% if ("exclusao".equals(erro)) { %>
            <p class="erro">Não foi possível excluir o item.</p>
        <% } %>

        <div class="topo-acoes">
            <a href="cadastro_item.jsp">Cadastrar Novo Item</a>
            <a href="../index.jsp">Voltar ao Painel</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Imagem</th>
                    <th>Nome</th>
                    <th>Categoria</th>
                    <th>Tipo</th>
                    <th>Local</th>
                    <th>Data</th>
                    <th>Status</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Item item : itens) { %>
                <tr>
                    <td>
                        <% if (item.getImagem() != null && !item.getImagem().isEmpty()) { %>
                            <img class="imagem-tabela" src="${pageContext.request.contextPath}/<%= item.getImagem() %>">
                        <% } else { %>
                            Sem imagem
                        <% } %>
                    </td>
                    <td><%= item.getNome() %></td>
                    <td><%= item.getCategoria() %></td>
                    <td><%= item.getTipo() %></td>
                    <td><%= item.getLocal() %></td>
                    <td><%= item.getDataOcorrencia() %></td>
                    <td><%= item.getStatus() %></td>
                    <td>
                        <div class="acoes">
                            <a href="visualizar_item.jsp?id=<%= item.getIdItem() %>">Visualizar</a>
                            <a href="editar_item.jsp?id=<%= item.getIdItem() %>">Editar</a>
                            <a href="executar_excluir_item.jsp?id=<%= item.getIdItem() %>"
                               onclick="return confirm('Deseja realmente excluir este item?')">Excluir</a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (itens.isEmpty()) { %>
            <p class="sem-registros">Nenhum item cadastrado.</p>
        <% } %>
    </div>
</body>
</html>