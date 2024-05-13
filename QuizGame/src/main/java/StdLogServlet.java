
import DatabaseDAO.UserDAO;
import DatabaseDAO.User;
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

@WebServlet(name = "StdLogSevlet", urlPatterns = {"/StdLogServlet"})
public class StdLogServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = null;

        try (PrintWriter out = response.getWriter()) {

            String buttonName = request.getParameter("Login") != null ? "Login" : "Register";

            if (buttonName.equals("Login")) {

                try {
                    user = userDAO.checkLogin(email, password);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }

                if (user != null) {

                    session = request.getSession();
                    session.setAttribute("user", user);
                    request.setAttribute("user", user.getName());
                    request.setAttribute("email", user.getEmail());
                    //response.sendRedirect("QuizRules.jsp");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("QuizRules.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.setContentType("text/html;charset=UTF-8");

                    out.println("<script>");
                    out.println("alert('Invalid email or password. Please try again!');");
                    out.println("window.location.href='StudentLogin.jsp';");
                    out.println("</script>");
                    //  request.setAttribute("message", "Invalid email or password. Please try again.");
                    // RequestDispatcher dispatcher = request.getRequestDispatcher("StudentLogin.jsp");
                    //dispatcher.forward(request, response);
                }

            } else {
                response.sendRedirect("RegisterStudent.jsp");
                //   RequestDispatcher dispatcher = request.getRequestDispatcher("StudentLogin.jsp");
                // dispatcher.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
