
import DatabaseDAO.QuestionDAO;
import DatabaseDAO.Question;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/QRuleServlet"})
public class QRuleServlet extends HttpServlet {

    private final QuestionDAO quesDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String count = request.getParameter("count");
        String user = request.getParameter("user");
        String email = request.getParameter("email");

        Question ques = null;

        try {
            ques = quesDAO.GetQuestion(count);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (ques != null) {

            session = request.getSession();
            session.setAttribute("ques", ques);

            request.setAttribute("count", count);
            request.setAttribute("question", ques.getQuestions());
            request.setAttribute("option1", ques.getOpt1());
            request.setAttribute("option2", ques.getOpt2());
            request.setAttribute("option3", ques.getOpt3());
            request.setAttribute("option4", ques.getOpt4());
            request.setAttribute("answer", ques.getAnswers());

            request.setAttribute("user", user);
            request.setAttribute("email", email);
            //response.sendRedirect("QuizRules.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Quiz.jsp");
            dispatcher.forward(request, response);
        }

    }
}
