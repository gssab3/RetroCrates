package rc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/ProdottoServlet")
public class ProdottoServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ProdottoServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipologia = (String) request.getParameter("TipoProdotto");
		
		if (tipologia != null) {
			
			ProdottoDAODataSource model = new ProdottoDAODataSource();
			try {
				Collection<ProdottoBean> prodotti = model.doRetrieveByCategory(tipologia);
				request.setAttribute("TipoProdotto", prodotti);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Paginaprodotti.jsp");
				dispatcher.forward(request, response);
			}
		}  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
