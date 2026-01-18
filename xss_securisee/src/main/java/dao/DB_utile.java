package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DB_utile {
    private static final String URL = "jdbc:h2:~/xss_db";
    private static final String USER = "sa";
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        try {
            Class.forName("org.h2.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur de connexion à la base de données.", e);
        }
    }


    public static void initialiserBD() {
        String sql = "CREATE TABLE IF NOT EXISTS QUESTION (id INT AUTO_INCREMENT PRIMARY KEY, contenu VARCHAR(1000) NOT NULL)";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
            System.out.println("Table QUESTION initialisée.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}