package dao;

import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;

public class Conexao {

    public static Connection conectar() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/app_db");

            return ds.getConnection();
        } catch (Exception e) {
            System.out.println("Erro ao conectar com o banco de dados via DataSource.");
            System.out.println(e.getMessage());
            return null;
        }
    }
}
