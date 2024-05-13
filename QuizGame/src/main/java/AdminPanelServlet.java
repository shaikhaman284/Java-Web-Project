
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AdminPanelServlet", urlPatterns = {"/AdminPanelServlet"})
public class AdminPanelServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

        String addquesNo = request.getParameter("addquesNo");
        String addques = request.getParameter("addquestion");
        String addopt1 = request.getParameter("addoption1Input");
        String addopt2 = request.getParameter("addoption2Input");
        String addopt3 = request.getParameter("addoption3Input");
        String addopt4 = request.getParameter("addoption4Input");
        String addans = request.getParameter("addanswer");

        String updtquesNo = request.getParameter("updtquesNo");
        String updtques = request.getParameter("updtquestion");
        String updtopt1 = request.getParameter("updtoption1Input");
        String updtopt2 = request.getParameter("updtoption2Input");
        String updtopt3 = request.getParameter("updtoption3Input");
        String updtopt4 = request.getParameter("updtoption4Input");
        String updtans = request.getParameter("updtanswer");

        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizdb", "root", "6967")) {

                if (addques != null) {
                    String query = "insert into questionsopt (quesno, questions, opt1, opt2, opt3, opt4, answers) values(?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, addquesNo);
                    pst.setString(2, addques);
                    pst.setString(3, addopt1);
                    pst.setString(4, addopt2);
                    pst.setString(5, addopt3);
                    pst.setString(6, addopt4);
                    pst.setString(7, addans);
                    int exen = pst.executeUpdate();
                    if (exen > 0) {
                        out.println("<script>");
                        out.println("alert('Question Added!');");
                        out.println("window.location.href='AdminPanel.jsp';");
                        out.println("</script>");
                    }
                } else if (updtques != null) {
                    String query = "update questionsopt set questions = ?, opt1 = ?, opt2 = ?, opt3 = ?, opt4 = ?, answers = ? where quesno = ?";
                    PreparedStatement pst = con.prepareStatement(query);

                    pst.setString(1, updtques);
                    pst.setString(2, updtopt1);
                    pst.setString(3, updtopt2);
                    pst.setString(4, updtopt3);
                    pst.setString(5, updtopt4);
                    pst.setString(6, updtans);
                    pst.setString(7, updtquesNo);
                    int exen = pst.executeUpdate();
                    if (exen > 0) {
                        out.println("<script>");
                        out.println("alert('Question Updated!');");
                        out.println("window.location.href='AdminPanel.jsp';");
                        out.println("</script>");
                    }
                } else if (email != null) {
                    response.sendRedirect("AdminPanel.jsp");
                }

            } catch (SQLException ex) {
                Logger.getLogger(AdminPanelServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminPanelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         *
         *
         * protected void doGet(HttpServletRequest request, HttpServletResponse
         * response) throws ServletException, IOException {
         * processRequest(request, response); }
         *
         *
         * @Override protected void doPost(HttpServletRequest request,
         * HttpServletResponse response) throws ServletException, IOException {
         * processRequest(request, response); }
         *
         *
         * @Override public String getServletInfo() { return "Short
         * description"; }// </editor-fold>
         */
    }

}
