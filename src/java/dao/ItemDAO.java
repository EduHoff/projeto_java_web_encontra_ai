package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Item;

public class ItemDAO {

    public boolean cadastrar(Item item) {
        String sql = "INSERT INTO item (nome, categoria, tipo, local, data_ocorrencia, descricao, status, imagem) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setString(1, item.getNome());
            stmt.setString(2, item.getCategoria());
            stmt.setString(3, item.getTipo());
            stmt.setString(4, item.getLocal());
            stmt.setDate(5, item.getDataOcorrencia());
            stmt.setString(6, item.getDescricao());
            stmt.setString(7, item.getStatus());
            stmt.setString(8, item.getImagem());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

            return true;
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar item.");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<Item> listarTodos() {
        List<Item> itens = new ArrayList<>();
        String sql = "SELECT * FROM item ORDER BY data_cadastro DESC";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Item item = new Item();

                item.setIdItem(rs.getInt("id_item"));
                item.setNome(rs.getString("nome"));
                item.setCategoria(rs.getString("categoria"));
                item.setTipo(rs.getString("tipo"));
                item.setLocal(rs.getString("local"));
                item.setDataOcorrencia(rs.getDate("data_ocorrencia"));
                item.setDescricao(rs.getString("descricao"));
                item.setStatus(rs.getString("status"));
                item.setImagem(rs.getString("imagem"));
                item.setDataCadastro(rs.getTimestamp("data_cadastro"));

                itens.add(item);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (Exception e) {
            System.out.println("Erro ao listar itens.");
            System.out.println(e.getMessage());
        }

        return itens;
    }

    public List<Item> listarPublicos() {
        List<Item> itens = new ArrayList<>();
        String sql = "SELECT * FROM item WHERE tipo = 'PERDIDO' AND status = 'ABERTO' ORDER BY data_cadastro DESC";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Item item = new Item();

                item.setIdItem(rs.getInt("id_item"));
                item.setNome(rs.getString("nome"));
                item.setCategoria(rs.getString("categoria"));
                item.setTipo(rs.getString("tipo"));
                item.setLocal(rs.getString("local"));
                item.setDataOcorrencia(rs.getDate("data_ocorrencia"));
                item.setDescricao(rs.getString("descricao"));
                item.setStatus(rs.getString("status"));
                item.setImagem(rs.getString("imagem"));
                item.setDataCadastro(rs.getTimestamp("data_cadastro"));

                itens.add(item);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (Exception e) {
            System.out.println("Erro ao listar itens públicos.");
            System.out.println(e.getMessage());
        }

        return itens;
    }

    public Item buscarPorId(int idItem) {
        String sql = "SELECT * FROM item WHERE id_item = ?";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idItem);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Item item = new Item();

                item.setIdItem(rs.getInt("id_item"));
                item.setNome(rs.getString("nome"));
                item.setCategoria(rs.getString("categoria"));
                item.setTipo(rs.getString("tipo"));
                item.setLocal(rs.getString("local"));
                item.setDataOcorrencia(rs.getDate("data_ocorrencia"));
                item.setDescricao(rs.getString("descricao"));
                item.setStatus(rs.getString("status"));
                item.setImagem(rs.getString("imagem"));
                item.setDataCadastro(rs.getTimestamp("data_cadastro"));

                rs.close();
                stmt.close();
                conexao.close();

                return item;
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (Exception e) {
            System.out.println("Erro ao buscar item.");
            System.out.println(e.getMessage());
        }

        return null;
    }

    public boolean atualizar(Item item) {
        String sql = "UPDATE item SET nome = ?, categoria = ?, tipo = ?, local = ?, data_ocorrencia = ?, descricao = ?, status = ?, imagem = ? WHERE id_item = ?";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);

            stmt.setString(1, item.getNome());
            stmt.setString(2, item.getCategoria());
            stmt.setString(3, item.getTipo());
            stmt.setString(4, item.getLocal());
            stmt.setDate(5, item.getDataOcorrencia());
            stmt.setString(6, item.getDescricao());
            stmt.setString(7, item.getStatus());
            stmt.setString(8, item.getImagem());
            stmt.setInt(9, item.getIdItem());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

            return true;
        } catch (Exception e) {
            System.out.println("Erro ao atualizar item.");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean excluir(int idItem) {
        String sql = "DELETE FROM item WHERE id_item = ?";

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idItem);

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

            return true;
        } catch (Exception e) {
            System.out.println("Erro ao excluir item.");
            System.out.println(e.getMessage());
            return false;
        }
    }
}
