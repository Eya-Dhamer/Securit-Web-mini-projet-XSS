package controller;

import dao.DB_utile;
import dao.QuestionDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GestionMessage extends HttpServlet {
    private QuestionDao questionDao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        DB_utile.initialiserBD();
        this.questionDao = new QuestionDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> historique = questionDao.getHistoriqueQuestions();

        request.setAttribute("historiqueQuestions", historique);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/FicheMessage.jsp");
        dispatcher.forward(request, response);
    }

    private String htmlEncode(String input) {
        if (input == null) {
            return null;
        }
        return input.replace("&", "&amp;")
                .replace("<", "&lt;") // CRUCIAL: Empêche l'ouverture de balises script
                .replace(">", "&gt;") // CRUCIAL: Empêche la fermeture de balises script
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");

        if (question != null && !question.trim().isEmpty()) {
            String questionSecurisee = htmlEncode(question);

            questionDao.deposerQuestion(questionSecurisee);
        }

        response.sendRedirect(request.getContextPath() + "/questions");
    }
}