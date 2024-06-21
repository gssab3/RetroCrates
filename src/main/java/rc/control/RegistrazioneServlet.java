package rc.control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rc.model.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;

/**
 * Servlet implementation class RegistraziomeServlet
 */
@WebServlet("/Registrazione")
public class RegistrazioneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 UtenteDAODataSource dao = new UtenteDAODataSource();
    	    String username = request.getParameter("username");
    	    String email = request.getParameter("email");
    	    String password = hashPassword(request.getParameter("password"));
    	    String data = request.getParameter("data");

    	    try {
    	        if((dao.doRetrieveByKey(username) != null) || (dao.doRetrieveByEmail(email) != null)) {
    	            request.setAttribute("errorMessage", "Username o email già in uso");
    	            request.getRequestDispatcher("/Register.jsp").forward(request, response);
    	        } else {
    	            UtenteBean user = new UtenteBean();
    	            user.setUsername(username);
    	            user.setEmail(email);
    	            user.setDatanas(data);
    	            user.setPasswordHash(password);
    	            user.setTipo("Utente");
    	            dao.doSave(user);
    	            response.sendRedirect(request.getContextPath() + "/login.jsp");
    	        }
    	    } catch (SQLException e) {
    	        // Log the exception and redirect the user to an error page
    	        System.out.println("Error:" + e.getMessage());
    	        response.sendRedirect("errorPage.jsp");
    	    }

        
    }


    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
