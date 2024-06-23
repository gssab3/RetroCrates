package rc.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rc.model.CarrelloBean;
import rc.model.CarrelloDAODataSource;
import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CarrelloServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qtacar = 1;
		if(request.getParameter("Azione") != null && request.getParameter("Azione").equals("diminuisci")){
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			if(carrello.retrieveByKey(idprodotto) != null)
				carrello.retrieveByKey(idprodotto).decrQta();
			else if(carrello.retrieveByKey(idprodotto) != null && carrello.retrieveByKey(idprodotto).getQta() == 1)
				carrello.removeItem(idprodotto);
			
			request.getSession().setAttribute("carrello", carrello);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("aumenta")) {
			
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			if(carrello.retrieveByKey(idprodotto) != null)
				carrello.retrieveByKey(idprodotto).addQta();
			
			request.getSession().setAttribute("carrello", carrello);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("rimuovere")) {
			
			String idprodotto = request.getParameter("IdProdotto");
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			
			if(!carrello.getCarrello().isEmpty())
				carrello.removeItem(idprodotto);
			request.getSession().setAttribute("carrello", carrello);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
			dispatcher.forward(request, response);
		} //Aggiungi = aggiungere un prodotto al carrello
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("aggiungi")) {
			
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			if(carrello == null)
				carrello = new CarrelloBean();
			String idprodotto = request.getParameter("idprodotto");
			/*Se c'è già nel carrello
			if(carrello.retrieveByKey(idprodotto) != null)
				carrello.retrieveByKey(idprodotto).addQta();
			//Se non c'è già
			else {
				ProdottoDAODataSource prodDao = new ProdottoDAODataSource();
				try {
					carrello.aggiungiCarrello(prodDao.doRetrieveByKey(idprodotto));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				}
			}
			*/
			ProdottoDAODataSource prodDao = new ProdottoDAODataSource();
			
			ProdottoBean prodottoadd = null;
			try {
				System.out.println("\n\n\n" + idprodotto);
				prodottoadd = prodDao.doRetrieveByKey(idprodotto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(prodottoadd != null) {
				if(carrello.retrieveByKey(idprodotto) != null)
					carrello.addQuantity(idprodotto);
				else {
					prodottoadd.setQta(1);
					carrello.aggiungiCarrello(prodottoadd);
				}
			}
				
			request.getSession().setAttribute("carrello", carrello);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
			dispatcher.forward(request, response);
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("svuota")) {
			CarrelloBean carrello = (CarrelloBean) request.getSession().getAttribute("carrello");
			
			if (!carrello.getCarrello().isEmpty()) {
				carrello.getCarrello().clear();
			}
			request.getSession().setAttribute("carrello", carrello);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	
	//RIDURRE LA QTA DEL PRODOTTO
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

