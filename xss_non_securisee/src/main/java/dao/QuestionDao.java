package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDao {
    public void deposerQuestion(String question) {
        String sql = "INSERT INTO QUESTION (contenu) VALUES (?)";
        try (Connection conn = DB_utile.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, question);
            stmt.executeUpdate();
            System.out.println("Question déposée : " + question);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String> getHistoriqueQuestions() {
        List<String> questions = new ArrayList<>();
        String sql = "SELECT contenu FROM QUESTION ORDER BY id DESC";
        try (Connection conn = DB_utile.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                questions.add(rs.getString("contenu"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
    }
}