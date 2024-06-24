package rc.control;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.sql.SQLException;

import rc.model.ProdottoBean;
import rc.model.ProdottoDAODataSource;

@WebServlet("/AddProdotto")
@MultipartConfig
public class AddProdotto extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AddProdotto() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProdottoBean prodotto = new ProdottoBean();
		
		
		 // Parametri del form
        String idProdotto = request.getParameter("IdProdotto");
        String nome = request.getParameter("Nome");
        String descrizione = request.getParameter("Descrizione");
        int qta = Integer.parseInt(request.getParameter("Qta"));
        boolean disponibile = request.getParameter("Disponibile") != null; // checkbox
        float costo = (float) Double.parseDouble(request.getParameter("Costo"));
        int stelle = Integer.parseInt(request.getParameter("Stelle"));
        String produttore = request.getParameter("Produttore");
        String tipoProdotto = request.getParameter("TipoProdotto");
        String categoria = request.getParameter("Categoria");
        String edizione = request.getParameter("Edizione");
        String genere = request.getParameter("Genere");
        String piattaforma = request.getParameter("Piattaforma");
        String tipogioco = request.getParameter("TipoGioco");

        // Gestione del file immagine
        Part filePart = request.getPart("foto");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();

        // Percorso dove salvare le immagini nel server
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images" + File.separator + "productIMG";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // Salvataggio del file immagine nel server
            Path filePath = Paths.get(uploadPath, fileName);
            Files.copy(fileContent, filePath);

         // Inside your doPost method after copying the file
            try {
                // Elimina il file temporaneo
                if (filePart != null) {
                    filePart.delete(); // Attempt to delete the temporary file
                }
            } catch (IOException e) {
                // Log the error or handle it as appropriate for your application
                e.printStackTrace(); // Example: Log the exception for debugging purposes
            }
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }

        ProdottoDAODataSource prodDao = new ProdottoDAODataSource();
        prodotto.setIdProdotto(idProdotto);
        prodotto.setNome(nome);
        prodotto.setDescr(descrizione);
        prodotto.setQta(qta);
        prodotto.setDisp(disponibile);
        prodotto.setCosto(costo);
        prodotto.setStelleTot(stelle);
        prodotto.setProduttore(produttore);
        prodotto.setTipoProdotto(tipoProdotto);
        prodotto.setCategoria(categoria);
        prodotto.setEdizione(edizione);
        prodotto.setPicture(fileName);
        prodotto.setGenere(genere);
        prodotto.setPiattaforma(piattaforma);
        prodotto.setTipoGioco(tipogioco);
        try {
			prodDao.doSave(prodotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
			request.setAttribute("prodotti", prodDao.doRetrieveAllAll(""));
			request.setAttribute("prodotto", prodotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // Assicurati che questa chiamata ritorni i dati corretti

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProdottoSingolo.jsp");
        dispatcher.forward(request, response);

}
	
}
