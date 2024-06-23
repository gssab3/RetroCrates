package rc.control;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.mysql.cj.jdbc.Blob;
import java.sql.SQLException;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

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
		/*
		String tipologia = (String) request.getAttribute("TipoProdotto");
		ProdottoBean prodotto = new ProdottoBean();
		prodotto.setIdProdotto(request.getParameter("IdProdotto"));
		prodotto.setNome(request.getParameter("Nome"));
		Part partdescr = request.getPart("Descr"); 
		if (partdescr != null) {
		    try (InputStream inputStream = partdescr.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setDescr(nome);
		    }
		}
		String qtaValue = request.getParameter("Qta");
		int qta = (qtaValue != null) ? Integer.parseInt(qtaValue) : 0;
		prodotto.setQta(qta);
		System.out.println("1" + prodotto.getIdProdotto() + prodotto.getQta());
		prodotto.setDisp(Boolean.parseBoolean(request.getParameter("Disponibile")));
		prodotto.setTipoProdotto(tipologia);
		/*Part filePart = request.getPart("foto");

		if (filePart != null) {
		    try (InputStream fileInputStream = filePart.getInputStream()) {
		        byte[] fileBytes = fileInputStream.readAllBytes();
		        
		        // Creazione dell'oggetto Blob
		        java.sql.Blob fotoBlob = new javax.sql.rowset.serial.SerialBlob(fileBytes);
		        
		        // Ora puoi utilizzare 'fotoBlob' per inserirlo nel database
		        prodotto.setPicture((com.mysql.cj.jdbc.Blob) fotoBlob);
		    } catch (IOException | SQLException e) {
		        e.printStackTrace();
		        // Gestisci l'errore in modo appropriato
		    }
		}
		
		Part costoPart = request.getPart("Costo");
		if (costoPart != null) {
		    prodotto.setCosto(Float.parseFloat(new String(costoPart.getInputStream().readAllBytes())));
		}
		
		Part stellePart = request.getPart("Stelle");
		if (stellePart != null) {
		    prodotto.setStelleTot(Integer.parseInt(new String(stellePart.getInputStream().readAllBytes())));
		}
		
        Part produttorePart = request.getPart("Produttore");
        if (produttorePart != null) {
            prodotto.setProduttore(new String(produttorePart.getInputStream().readAllBytes()));
        }
        
        Part generePart = request.getPart("Genere");
        if (generePart != null) {
            prodotto.setGenere(new String(generePart.getInputStream().readAllBytes()));
        }
        
        Part piattaformaPart = request.getPart("Piattaforma");
        if (piattaformaPart != null) {
            prodotto.setPiattaforma(new String(piattaformaPart.getInputStream().readAllBytes()));
        }
        
        Part tipoGiocoPart = request.getPart("TipoGioco");
        if (tipoGiocoPart != null) {
            prodotto.setTipoGioco(new String(tipoGiocoPart.getInputStream().readAllBytes()));
        }
        
        Part edizionePart = request.getPart("Edizione");
        if (edizionePart != null) {
            prodotto.setEdizione(new String(edizionePart.getInputStream().readAllBytes()));
        }
        
        Part categoriaPart = request.getPart("Categoria");
        if (categoriaPart != null) {
            prodotto.setCategoria(new String(categoriaPart.getInputStream().readAllBytes()));
        }
        ProdottoDAODataSource prodDao = new ProdottoDAODataSource();
        try {
			prodDao.doSave(prodotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
         */
		/*
		String idProdotto = request.getParameter("IdProdotto");
        String nome = request.getParameter("Nome");
        String descrizione = request.getParameter("Descrizione");
        int qta = Integer.parseInt(request.getParameter("Qta"));
        boolean disponibile = request.getParameter("Disponibile") != null;
        //Part foto = request.getPart("foto");
        double costo = Double.parseDouble(request.getParameter("Costo"));
        int stelle = Integer.parseInt(request.getParameter("Stelle"));
        String produttore = request.getParameter("Produttore");
        String genere = request.getParameter("Genere");
        String piattaforma = request.getParameter("Piattaforma");
        String tipoGioco = request.getParameter("TipoGioco");
        String tipoProdotto = request.getParameter("TipoProdotto");
        String categoria = request.getParameter("Categoria");
        String edizione = request.getParameter("Edizione");
        System.out.println(idProdotto);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		*/	
		
		Part parteid = request.getPart("IdProdotto"); 
		if (parteid != null) {
		    try (InputStream inputStream = parteid.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        System.out.println(nome);
		    }
		}
		}
	
}
