<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EncontraAi - Cadastrar Item</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="pagina-formulario">
    <div class="container">
        <h1>EncontraAi</h1>
        <h2>Cadastrar Item</h2>

        <%
            String erro = request.getParameter("erro");

            if (erro != null) {
        %>
            <p class="erro">Não foi possível cadastrar o item.</p>
        <%
            }
        %>

        <form action="executar_cadastro_item.jsp" method="post" enctype="multipart/form-data">
            <label>Nome do item</label>
            <input type="text" name="nome" required>

            <label>Categoria</label>
            <input type="text" name="categoria" required>

            <label>Tipo</label>
            <select name="tipo" required>
                <option value="">Selecione</option>
                <option value="PERDIDO">Perdido</option>
                <option value="ENCONTRADO">Encontrado</option>
            </select>

            <label>Local</label>
            <input type="text" name="local" required>

            <label>Data da ocorrência</label>
            <input type="date" name="dataOcorrencia" required>

            <label>Descrição</label>
            <textarea name="descricao" required></textarea>

            <label>Imagem</label>
            <input type="file" name="imagem" accept="image/*">

            <input type="hidden" name="status" value="ABERTO">

            <button type="submit">Cadastrar</button>
        </form>

        <div class="menu">
            <a href="listar_item.jsp">Consultar Itens</a>
            <a href="../index.jsp">Voltar</a>
        </div>
    </div>
</body>
</html>
