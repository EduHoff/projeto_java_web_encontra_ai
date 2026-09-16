<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>
<%@page import="java.io.File"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int idItem;

    try {
        idItem = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        response.sendRedirect("listar_item.jsp");
        return;
    }

    ItemDAO itemDAO = new ItemDAO();
    Item item = itemDAO.buscarPorId(idItem);

    if (item == null) {
        response.sendRedirect("listar_item.jsp");
        return;
    }

    if (itemDAO.excluir(idItem)) {
        if (item.getImagem() != null && !item.getImagem().isEmpty()) {
            String caminhoImagem = application.getRealPath("/" + item.getImagem());
            File arquivoImagem = new File(caminhoImagem);

            if (arquivoImagem.exists()) {
                arquivoImagem.delete();
            }
        }

        response.sendRedirect("listar_item.jsp?sucesso=exclusao");
    } else {
        response.sendRedirect("listar_item.jsp?erro=exclusao");
    }
%>