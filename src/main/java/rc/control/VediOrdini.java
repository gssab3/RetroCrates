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

import org.eclipse.jdt.internal.compiler.ast.AND_AND_Expression;

import rc.model.OrdineBean;
import rc.model.OrdineDAODataSource;
import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

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
	    OrdineDAODataSource model = new OrdineDAODataSource();
	    Collection<OrdineBean> ordini = null;
	    String sortMode = request.getParameter("sort");
	    String datex = request.getParameter("datax");
	    String datey = request.getParameter("datay");
	    String utente = request.getParameter("utente");

	    // Convert empty strings to null
	    if (datex != null && datex.isEmpty()) {
	        datex = null;
	    }
	    if (datey != null && datey.isEmpty()) {
	        datey = null;
	    }

	    if(sortMode == null)
	        sortMode = "0";
	    if(sortMode.equals("0") && utente.equals("TUTTI"))
	    {
	        try {
	            ordini = model.doRetrieveAll("");
	            request.setAttribute("ordini", ordini);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        finally {
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/vediordini.jsp");
	            dispatcher.forward(request, response);
	        }
	    }
	    else if(sortMode.equals("1")) {
	        try {
	            ordini = model.doRetrieveDateByDate(datex, datey);
	            request.setAttribute("ordini", ordini);
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }
	        finally {
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/vediordini.jsp");
	            dispatcher.forward(request, response);
	        }
	    }
	    else if (sortMode.equals("2")) {
	        try {
	            ordini = model.doRetrieveByUser(utente);
	            request.setAttribute("ordini", ordini);
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }
	        finally {
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/vediordini.jsp");
	            dispatcher.forward(request, response);
	        }
	        
	    }
	}




	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
