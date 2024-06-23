package rc.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AdminServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipologia = request.getParameter("TipoProdotto");
		if(tipologia.compareTo("Console")==0) {
			request.getSession().setAttribute("TipoProdotto", "Console");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AddProdotto.jsp?TipoProdotto=" + tipologia);
			dispatcher.forward(request, response);
		}
		else if (tipologia.compareTo("Videogioco")==0) {
			request.getSession().setAttribute("TipoProdotto", "Videogioco");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AddProdotto.jsp?TipoProdotto=" + tipologia);
			dispatcher.forward(request, response);
		}
		else if (tipologia.compareTo("Collezionabile")==0) {
			request.getSession().setAttribute("TipoProdotto", "Collezionabile");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/AddProdotto.jsp?TipoProdotto=" + tipologia);
			dispatcher.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
