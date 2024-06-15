package rc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TipologiaControl")
public class TipologiaControl extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public TipologiaControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipologia = request.getParameter("TipoProdotto");
		if(tipologia.compareTo("Console")==0) {
			request.getSession().setAttribute("TipoProdotto", "Console");
		}
		else if (tipologia.compareTo("Videogiochi")==0) {
			request.getSession().setAttribute("TipoProdotto", "Videogiochi");
		}
		else if (tipologia.compareTo("Collezionabili")==0) {
			request.getSession().setAttribute("TipoProdotto", "Collezionabili");
		}
		response.sendRedirect(request.getContextPath()+"/Paginaprodotti.jsp?TipoProdotto=" + tipologia);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
