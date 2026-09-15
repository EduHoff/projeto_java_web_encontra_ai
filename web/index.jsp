<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.Conexao"%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Teste de Conexão DAO</title>
    </head>
    <body>
        <h1>Testando Conexão via dao.Conexao</h1>

        <%
            String statusTeste = "";
            boolean deuCerto = false;

            try (Connection conn = Conexao.conectar()) {
                if (conn != null && !conn.isClosed()) {
                    deuCerto = true;
                    statusTeste = "Conexão via dao.Conexao.conectar() realizada com sucesso!";
                } else {
                    statusTeste = "A conexão retornou nula.";
                }
            } catch (Exception e) {
                statusTeste = "Erro ao fechar ou abrir a conexão: " + e.getMessage();
            }
        %>

        <div style="margin-top: 20px; padding: 15px; border-radius: 5px; background-color: <%= deuCerto ? "#d4edda" : "#f8d7da" %>; color: <%= deuCerto ? "#155724" : "#721c24" %>;">
            <strong>Resultado:</strong> <%= statusTeste %>
        </div>
    </body>
</html>
