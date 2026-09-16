package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Usuario;

public class UsuarioDAO {

    public Usuario autenticar(String login, String senha) {
        String sql = "SELECT * FROM usuario WHERE login = ? AND senha = ? AND ativo = TRUE";

        try {
            Connection conexao = Conexao.conectar();

            if (conexao == null) {
                return null;
            }

            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setLogin(rs.getString("login"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAtivo(rs.getBoolean("ativo"));

                rs.close();
                stmt.close();
                conexao.close();

                return usuario;
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (Exception e) {
            System.out.println("Erro ao autenticar usuário.");
            System.out.println(e.getMessage());
        }

        return null;
    }
}
