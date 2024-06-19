package rc.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/RicercaProdottoServlet")
public class RicercaProdottoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public RicercaProdottoServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String numero = request.getParameter("input")	;	
		String query = request.getParameter("query");
		String tipoprodotto = "Console"; 
		
		Collection<ProdottoBean> risultato = new ArrayList<>();
		ProdottoDAODataSource dao = new ProdottoDAODataSource();
		Collection<ProdottoBean> prodotti;
		
		if(numero.equals("1")){
			try {
				prodotti = dao.doRetrieveAll(null);
				for(ProdottoBean p : prodotti) {
					for(int i=0; i<p.getNome().length() - 1;i++) {
						for(int j=i+1; j<p.getNome().length(); j++) {
							if(((String) p.getNome().subSequence(i,j)).equalsIgnoreCase(query) && !risultato.contains(p)){
								risultato.add(p);
							}

						}
						
					}
				}
				
				request.setAttribute("TipoProdotto", tipoprodotto);
				request.setAttribute("prodotti", prodotti);
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Paginaprodotti.jsp");
				dispatcher.forward(request, response);
			}
		}
		else{
			try {
				prodotti = dao.doRetrieveAll(null);
				for(ProdottoBean p : prodotti) {
					for(int i=0; i<p.getNome().length() - 1;i++) {
						for(int j=i+1; j<p.getNome().length(); j++) {
							if(((String) p.getNome().subSequence(i,j)).equalsIgnoreCase(query) && !risultato.contains(p)){
								risultato.add(p);
							}

						}
						
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			String json = new Gson().toJson(risultato);
			
			response.getWriter().write(json);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
