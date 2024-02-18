import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginpage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate username and password (you should replace this with your own validation logic)
        if ("shailesh".equals(username) && "2417".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("customer_handle.jsp");
        } else {
            response.sendRedirect("loginpage.html"); // Redirect back to login page if credentials are incorrect
        }
    }
}
