package rc.control;

import java.io.IOException;
import rc.model.*;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/index")
public class index extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public index() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdottoDAODataSource model = new ProdottoDAODataSource();
		Collection<ProdottoBean> prodotti = null;
		UtenteDAODataSource utdao = new UtenteDAODataSource();
		HttpSession session = request.getSession(true);
        
		try {
			UtenteBean utente = (UtenteBean) session.getAttribute("currentSessionUser");
			if(utente != null && utente.getTipo().equals("Admin")) {
				System.out.println("ciao");
	        	prodotti = model.doRetrieveAllAll("");
				//prodotti = model.doRetrieveAll("");
	        }
			else
				prodotti = model.doRetrieveAll("");

			request.setAttribute("prodotti", prodotti);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
