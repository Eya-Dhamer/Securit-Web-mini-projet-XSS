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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");

        if (question != null && !question.trim().isEmpty()) {
            questionDao.deposerQuestion(question);
        }

        response.sendRedirect(request.getContextPath() + "/questions");
    }
}