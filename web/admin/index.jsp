<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Administração</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-centralizada">
    <div class="container container-pequeno">
        <h1>EncontraAi</h1>
        <h2>Área Administrativa</h2>

        <p>Bem-vindo, <strong><%= usuarioLogado.getNome() %></strong></p>

        <div class="menu">
            <a href="itens/cadastro_item.jsp">Cadastrar Item</a>
            <a href="itens/listar_item.jsp">Consultar Itens</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
</body>
</html>
