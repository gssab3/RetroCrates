package rc.control;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.mysql.cj.jdbc.Blob;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;
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
		ProdottoBean prodotto = new ProdottoBean();
		/*
		String qtaValue = request.getParameter("Qta");
		
		prodotto.setDisp(Boolean.parseBoolean(request.getParameter("Disponibile")));
		prodotto.setTipoProdotto(tipologia);
		/*Part filePart = request.getPart("foto");

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
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		*/	
		
		//Tipologia
		String tipologia = (String) request.getAttribute("TipoProdotto");
		
		//Id
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
		        prodotto.setIdProdotto(nome);
		    }
		}
		
		//Nome
		Part partenome = request.getPart("Nome"); 
		if (partenome != null) {
		    try (InputStream inputStream = partenome.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setNome(nome);
		    }
		}
		
		
		//Descr
		Part partdescr = request.getPart("Descrizione"); 
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
		
		//Qta
		Part partqta = request.getPart("Qta");
		if (partqta != null) {
		    try (InputStream inputStream = partqta.getInputStream()) {
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String qtaString = outputStream.toString("UTF-8");
		        int qta = Integer.parseInt(qtaString);
		        prodotto.setQta(qta);
		    } catch (NumberFormatException e) {
		        System.out.println(e.getMessage());
		    }
		}
		
		//Disp
		Part partDisp = request.getPart("disponibile");
		if (partDisp != null) {
		    try (InputStream inputStream = partDisp.getInputStream()) {
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String dispValue = outputStream.toString("UTF-8").trim();
		        boolean disp = Boolean.parseBoolean(dispValue);
		        prodotto.setDisp(disp);
		    }
		}
		
		
		// Campo Costo (float)
		Part partCosto = request.getPart("Costo");
		if (partCosto != null) {
		    try (InputStream inputStream = partCosto.getInputStream()) {
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String costoValue = outputStream.toString("UTF-8").trim();
		        float costo = Float.parseFloat(costoValue);
		        prodotto.setCosto(costo);
		    }
		}
		
		
		//Stelle
		Part partstelle = request.getPart("Stelle");
		if (partstelle != null) {
		    try (InputStream inputStream = partstelle.getInputStream()) {
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String stelles = outputStream.toString("UTF-8");
		        int stelle = Integer.parseInt(stelles);
		        prodotto.setStelleTot(stelle);
		    } catch (NumberFormatException e) {
		        System.out.println(e.getMessage());
		    }
		}
		
		
		
		//Produttore
		Part parteprod = request.getPart("Produttore"); 
		if (parteprod != null) {
		    try (InputStream inputStream = parteprod.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setProduttore(nome);
		    }
		}
		
		
		//Genere
		Part partegenere = request.getPart("Genere"); 
		if (partegenere != null) {
		    try (InputStream inputStream = partegenere.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setGenere(nome);
		    }
		}
		
		
		//Piattaforma
		Part partepiattaforma = request.getPart("Piattaforma"); 
		if (partepiattaforma != null) {
		    try (InputStream inputStream = partepiattaforma.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setPiattaforma(nome);
		    }
		}
		
		//TipoGioco
		Part partegioco = request.getPart("TipoGioco"); 
		if (partegioco != null) {
		    try (InputStream inputStream = partegioco.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setTipoGioco(nome);
		    }
		}

		
		/*
		Part parteprodotto = request.getPart("TipoProdotto"); 
		if (parteprodotto != null) {
		    try (InputStream inputStream = parteprodotto.getInputStream()) {
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String tipoProdotto = outputStream.toString("UTF-8").trim();
		        prodotto.setTipoProdotto(tipoProdotto);
		    }
		}
		*/
		
		String tipoProdotto = request.getParameter("TipoProdotto");
		if (tipoProdotto != null) {
		    tipoProdotto = tipoProdotto.trim(); // Rimuovi eventuali spazi bianchi in eccesso
		    prodotto.setTipoProdotto(tipoProdotto);
		}
		
		//Categoria
		Part partecate = request.getPart("Categoria"); 
		if (partecate != null) {
		    try (InputStream inputStream = partecate.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setCategoria(nome);
		    }
		}
		
		
		//Edizione
		Part parteedizione = request.getPart("Edizione"); 
		if (parteedizione != null) {
		    try (InputStream inputStream = parteedizione.getInputStream()) {
		        // Leggi i dati del campo del form
		        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		        byte[] buffer = new byte[1024];
		        int bytesRead;
		        while ((bytesRead = inputStream.read(buffer)) != -1) {
		            outputStream.write(buffer, 0, bytesRead);
		        }
		        String nome = outputStream.toString("UTF-8"); // Converti i dati del campo del form in una stringa
		        prodotto.setEdizione(nome);
		    }
		}
		
		Part filePart = request.getPart("Foto");
        if (filePart != null) {
            try (InputStream fileInputStream = filePart.getInputStream()) {
                byte[] fileBytes = fileInputStream.readAllBytes();

                // Creazione dell'oggetto com.mysql.cj.jdbc.Blob dai byte letti
                com.mysql.cj.jdbc.Blob fotoBlob = createMySQLBlob(fileBytes);

                // Impostazione della fotoBlob nel prodotto
                prodotto.setPicture(fotoBlob);
            } catch (IOException | SQLException e) {
                e.printStackTrace();
                // Gestisci l'errore in modo appropriato
            }
        }
		
		ProdottoDAODataSource prodDao = new ProdottoDAODataSource();
        try {
			prodDao.doSave(prodotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
	
	// Metodo per creare un com.mysql.cj.jdbc.Blob dai byte letti
	private com.mysql.cj.jdbc.Blob createMySQLBlob(byte[] bytes) throws SQLException {
	    Context initCtx = null;
	    try {
	        initCtx = new InitialContext();
	    } catch (NamingException e) {
	        e.printStackTrace();
	        throw new SQLException("Errore durante l'inizializzazione del contesto iniziale", e);
	    }
	    
	    Context envCtx = null;
	    try {
	        envCtx = (Context) initCtx.lookup("java:comp/env");
	    } catch (NamingException e) {
	        e.printStackTrace();
	        throw new SQLException("Errore durante il lookup del contesto dell'ambiente", e);
	    }

	    DataSource ds = null;
	    try {
	        ds = (DataSource) envCtx.lookup("jdbc/retrocrates");
	    } catch (NamingException e) {
	        e.printStackTrace();
	        throw new SQLException("Errore durante il lookup del DataSource", e);
	    }
	    
	    Connection connection = null;
	    try {
	        // Ottieni la connessione dalla tua connection pool
	        connection = ds.getConnection();

	        // Creazione di un oggetto Blob standard di JDBC a partire dall'array di byte
	        Blob standardBlob = (com.mysql.cj.jdbc.Blob) connection.createBlob();
	        standardBlob.setBytes(1, bytes); // Imposta i byte nel Blob

	        // Cast esplicito a com.mysql.cj.jdbc.Blob
	        com.mysql.cj.jdbc.Blob mysqlBlob = (com.mysql.cj.jdbc.Blob) standardBlob;

	        return mysqlBlob;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // Rilancia l'eccezione per gestirla nel chiamante
	    } finally {
	        // Chiudi la connessione
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace(); // Gestisci l'eccezione in caso di errore durante la chiusura
	            }
	        }
	    }
	}

	
}
