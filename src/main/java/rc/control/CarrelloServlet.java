package rc.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rc.model.CarrelloBean;
import rc.model.CarrelloDAODataSource;

public class CarrelloServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CarrelloServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Azione") != null && request.getParameter("Azione").equals("diminuisci")){
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			carrello.retriveByKey(idprodotto).decrQta();
			
			if(carrello.retriveByKey(idprodotto).getQta()==0) {
				carrello.removeItem(idprodotto);
			}
			request.getSession().setAttribute("carrello", carrello);
			//request.getRequestDispatcher()
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("aumenta")) {
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			
			if (carrello.retriveByKey(idprodotto).getQta() != 99) {
				carrello.retriveByKey(idprodotto).addQta();
			}
			request.getSession().setAttribute("carrello", carrello);
			//request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("rimuovere")) {
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			
			if (!carrello.isEmpty()) {
				carrello.removeItem(idprodotto);
			}
			request.getSession().setAttribute("carrello", carrello);
			//request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("aggiungi")) {
			
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloDAODataSource model = new CarrelloDAODataSource();
			
			try {
				carrello = model.aggiungiAlCarrello(carrello, idprodotto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("carrello", carrello);
			//request.getRequestDispatcher("/ProductsPage.jsp").forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("svuota")) {
			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

