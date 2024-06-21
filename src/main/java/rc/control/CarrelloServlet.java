package rc.control;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rc.model.CarrelloBean;

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
			
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("rimuovere")) {
			
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("aggiungi")) {
			
		}
		else if (request.getParameter("Azione") != null && request.getParameter("Azione").equals("svuota")) {
			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

