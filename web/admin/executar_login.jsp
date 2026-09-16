<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>

<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    UsuarioDAO usuarioDAO = new UsuarioDAO();
    Usuario usuario = usuarioDAO.autenticar(login, senha);

    if (usuario != null) {
        session.setAttribute("usuarioLogado", usuario);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp?erro=1");
    }
%>
