
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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/QuizServlet"})
public class QuizServlet extends HttpServlet {

    private final QuestionDAO quesDAO = new QuestionDAO();
    public static int score = 0;
    public static int rowno;

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

        PrintWriter out = response.getWriter();

        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String count = request.getParameter("count");
        String question = request.getParameter("question");
        String userAnswer = request.getParameter("option");
        String answer = request.getParameter("answer");
        String buttonName = request.getParameter("next") != null ? "next" : "submit";

        int counter = Integer.parseInt(count);
        int quesno = counter - 1;
        int marks;
        Question ques = null;
        if (userAnswer != null) {

            if (userAnswer.equals(answer)) {
                marks = 2;
                score = score + 2;
            } else {
                marks = 0;
                score = score + 0;
            }
            try {
                quesDAO.InsertResp(email, quesno, question, userAnswer, answer, marks);
            } catch (SQLException ex) {
                Logger.getLogger(QuizServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(QuizServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        Question rows = null;
        try {
            rows = quesDAO.GetRowno();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        if (rows != null) {
            rowno = rows.getRowno();
        }
        if (counter <= rowno) {
            try {
                ques = quesDAO.GetQuestion(count);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        if (buttonName.equals("next")) {

            if (ques != null) {
                session = request.getSession();
                session.setAttribute("ques", ques);
                session.setAttribute("user", user);
                session.setAttribute("question", question);
                session.setAttribute("userAnswer", userAnswer);
                session.setAttribute("answer", answer);

                request.setAttribute("count", count);
                request.setAttribute("question", ques.getQuestions());
                request.setAttribute("option1", ques.getOpt1());
                request.setAttribute("option2", ques.getOpt2());
                request.setAttribute("option3", ques.getOpt3());
                request.setAttribute("option4", ques.getOpt4());
                request.setAttribute("answer", ques.getAnswers());
                request.setAttribute("score", score);
                request.setAttribute("user", user);
                request.setAttribute("email", email);

                //response.sendRedirect("QuizRules.jsp");
                RequestDispatcher dispatcher = request.getRequestDispatcher("Quiz.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("user", user);
            request.setAttribute("score", score);
            request.setAttribute("email", email);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Score.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    public void destroy() {

    }
}
