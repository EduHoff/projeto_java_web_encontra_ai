<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>
<%@page import="java.util.List"%>

<%
    ItemDAO itemDAO = new ItemDAO();
    List<Item> itens = itemDAO.listarPublicos();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Achados e Perdidos</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-publica">
    <div class="publico-container">
        <div class="publico-topo">
            <div>
                <h1>EncontraAi</h1>
                <p>Objetos perdidos que ainda estão sendo procurados.</p>
            </div>

            <a class="btn-admin" href="admin/login.jsp">Área Administrativa</a>
        </div>

        <% if (itens.isEmpty()) { %>
            <div class="sem-itens">
                <h2>Nenhum objeto perdido no momento.</h2>
                <p>Não existem ocorrências abertas para consulta.</p>
            </div>
        <% } else { %>

            <div class="grid-itens">
                <% for (Item item : itens) { %>
                    <div class="card-item">

                        <% if (item.getImagem() != null && !item.getImagem().isEmpty()) { %>
                            <img src="${pageContext.request.contextPath}/<%= item.getImagem() %>"
                                 alt="<%= item.getNome() %>">
                        <% } else { %>
                            <div class="sem-imagem">Sem imagem</div>
                        <% } %>

                        <div class="card-conteudo">
                            <span class="categoria"><%= item.getCategoria() %></span>
                            <h2><%= item.getNome() %></h2>

                            <p><strong>Local:</strong> <%= item.getLocal() %></p>
                            <p><strong>Data:</strong> <%= item.getDataOcorrencia() %></p>

                            <a href="detalhe_item.jsp?id=<%= item.getIdItem() %>">
                                Ver detalhes
                            </a>
                        </div>
                    </div>
                <% } %>
            </div>

        <% } %>
    </div>
</body>
</html>
