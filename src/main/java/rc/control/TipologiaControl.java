package rc.control;

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
			String produttore = request.getParameter("Produttore");
			response.sendRedirect(request.getContextPath()+"/Paginaprodotti.jsp?TipoProdotto=" + tipologia +"&Produttore=" + produttore);
		}
		else if (tipologia.compareTo("Videogioco")==0) {
			request.getSession().setAttribute("TipoProdotto", "Videogioco");
			String genere = request.getParameter("Genere");
			response.sendRedirect(request.getContextPath()+"/Paginaprodotti.jsp?TipoProdotto=" + tipologia +"&Genere=" + genere);
		}
		else if (tipologia.compareTo("Collezionabile")==0) {
			request.getSession().setAttribute("TipoProdotto", "Collezionabile");
			String categoria = request.getParameter("Categoria");
			response.sendRedirect(request.getContextPath()+"/Paginaprodotti.jsp?TipoProdotto=" + tipologia +"&Categoria=" + categoria);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
