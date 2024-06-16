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

import org.eclipse.jdt.internal.compiler.ast.AND_AND_Expression;

import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/CollezionabiliServlet")
public class CollezionabiliServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CollezionabiliServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipologia = (String) request.getParameter("TipoProdotto");
		
		String categoria = (String) request.getParameter("Genere");
		
		ProdottoDAODataSource model = new ProdottoDAODataSource();
		Collection<ProdottoBean> prodotti = null;
		
		try {
			if (tipologia != null && !tipologia.equals("TUTTI") && categoria != null && !categoria.equals("TUTTI")) {
				prodotti = model.doRetrieveByCategoryProducer(tipologia, categoria);
				request.setAttribute("Produttore", categoria);
			} else if (tipologia != null && !tipologia.equals("TUTTI")) {
				prodotti = model.doRetrieveByCategory(tipologia);
			} else {
				prodotti = model.doRetrieveAll("");
			}
			
			request.setAttribute("TipoProdotto", tipologia);
			request.setAttribute("Categoria", categoria);
			request.setAttribute("prodotti", prodotti);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Paginaprodotti.jsp");
			dispatcher.forward(request, response);
		}
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
