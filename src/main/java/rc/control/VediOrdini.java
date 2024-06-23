package rc.control;

import java.io.IOException;

import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import rc.model.OrdineBean;
import rc.model.OrdineDAODataSource;
import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;
import rc.model.UtenteBean;

@WebServlet("/VediOrdini")
public class VediOrdini extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public VediOrdini() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		 HttpSession sessione = request.getSession(true);
	        UtenteBean utUtil = (UtenteBean) sessione.getAttribute("currentSessionUser");

	        if (utUtil == null) {
	            response.sendRedirect(request.getContextPath() + "/index");
	            return; // Uscita anticipata per evitare l'esecuzione del codice rimanente
	        }
		
		OrdineDAODataSource model = new OrdineDAODataSource();
        Collection<OrdineBean> ordini = null;
        String sortMode = request.getParameter("sort");
        String datex = request.getParameter("datax");
        String datey = request.getParameter("datay");
        String utente = request.getParameter("utente");

        try {
            if (sortMode == null || ("0".equals(sortMode) && "TUTTI".equals(utente))) {
                ordini = model.doRetrieveAll("");
            } else if ("1".equals(sortMode)) {
                ordini = model.doRetrieveDateByDate(datex, datey);
            } else if ("2".equals(sortMode)) {
                ordini = model.doRetrieveByUser(utente);
            } else if ("3".equals(sortMode)) {
                ordini = model.doRetrieveByUser(utente);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/user/account.jsp");
                request.setAttribute("ordini", ordini);
                dispatcher.forward(request, response);
                return; 
            }
            request.setAttribute("ordini", ordini);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/vediordini.jsp");
        dispatcher.forward(request, response);
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
