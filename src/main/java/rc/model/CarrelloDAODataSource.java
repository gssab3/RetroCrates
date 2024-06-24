package rc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import rc.control.DriverManagerConnectionPool;

import java.security.SecureRandom;

public class CarrelloDAODataSource{
	/*public synchronized CarrelloBean updateCarrello(ProdottoBean prodotto, CarrelloBean carrello) {
		Collection<ProdottoBean> collection = carrello.getCarrello();
		Collection<ProdottoBean> lista = new LinkedList<ProdottoBean>();
		
		if(collection != null && collection.size() != 0) {
			Iterator<?> iteratore = collection.iterator();
			while(iteratore.hasNext()) {
				ProdottoBean prodottoBean = (ProdottoBean) iteratore.next();
				if(prodottoBean.getIdProdotto().equals(prodotto.getIdProdotto())) {
					iteratore.remove();
					if(prodottoBean.getTipoProdotto().equals("Console")) {
					   prodottoBean.setNome(prodotto.getNome());
					   prodottoBean.setQta(prodotto.getQta());
					   prodottoBean.setCosto(prodotto.getCosto());
					   prodottoBean.setProduttore(prodotto.getProduttore());
					}
					else if (prodottoBean.getTipoProdotto().equals("Videogioco")) {
						prodottoBean.setNome(prodotto.getNome());
						prodottoBean.setQta(prodotto.getQta());
						prodottoBean.setCosto(prodotto.getCosto());
						prodottoBean.setProduttore(prodotto.getProduttore());
						prodottoBean.setGenere(prodotto.getGenere());
						prodottoBean.setPiattaforma(prodotto.getPiattaforma());
						prodottoBean.setTipoGioco(prodotto.getTipoGioco());
						prodottoBean.setEdizione(prodotto.getEdizione());
					}
					else if (prodottoBean.getTipoProdotto().equals("Collezionabile")) {
						prodottoBean.setNome(prodotto.getNome());
						prodottoBean.setQta(prodotto.getQta());
						prodottoBean.setCosto(prodotto.getCosto());
						prodottoBean.setProduttore(prodotto.getProduttore());
						prodottoBean.setEdizione(prodotto.getEdizione());
						prodottoBean.setCategoria(prodotto.getCategoria());
					}	
				}
				lista.add(prodottoBean);
			}
			carrello.setLista(lista);
		}
		
		return carrello;
	}
	*/
	/*
	public synchronized CarrelloBean acquista(CarrelloBean carrello, UtenteBean utente, String Destinazione) throws SQLException {
	    Connection con = null;
	    Collection<ProdottoBean> carrellobean = carrello.getCarrello();
	    String sql = "INSERT INTO Ordine (IdOrdine, Utente, Destinazione, Email, CostoTotale, DataOrdine) VALUES (?, ?, ?, ?, ?, current_date())";
	    String sql2 = "INSERT INTO ContieneProd (IdOrdine, IdProdotto, Qta, Costo) VALUES (?, ?, ?, ?)";
	    Double prezzotot = 0.0;
	    String ordinecodice = null;

	    try {
	        con = DriverManagerConnectionPool.getConnection();
	        con.setAutoCommit(false); // Disable auto-commit for transaction management

	        if (carrellobean != null && !carrellobean.isEmpty()) {
	            // Codice univoco dell'ordine
	            ordinecodice = generateUniqueString();
	            ProdottoDAODataSource prodottoDAO = new ProdottoDAODataSource(); // Assume we have this class to retrieve product data

	            // Check if all products are available in required quantity
	            for (ProdottoBean prodotto : carrellobean) {
	                ProdottoBean prodottoDB = prodottoDAO.doRetrieveByKey(prodotto.getIdProdotto());
	                if (prodottoDB == null || prodotto.getQta() > prodottoDB.getQta()) {
	                    // If any product's quantity in the cart is greater than available, cancel the operation
	                    con.rollback();
	                    return carrello; // No changes made, return the cart as is
	                }
	            }

	            // Insert order details into Ordine table
	            for (ProdottoBean prodotto : carrellobean) {
	                prezzotot += prodotto.getCosto() * prodotto.getQta();
	            }

	            PreparedStatement query = con.prepareStatement(sql);
	            query.setString(1, ordinecodice); // Use a unique identifier for the order
	            query.setString(2, utente.getUsername());
	            query.setString(3, Destinazione);
	            query.setString(4, utente.getEmail());
	            query.setDouble(5, prezzotot);
	            query.executeUpdate();

	            // If all quantities are valid, proceed with order creation
	            for (ProdottoBean prodotto : carrellobean) {
	                // Insert product details into ContieneProd table
	                PreparedStatement query2 = con.prepareStatement(sql2);
	                query2.setString(1, ordinecodice); // Id Ordine
	                query2.setString(2, prodotto.getIdProdotto()); // Id Prodotto
	                query2.setInt(3, prodotto.getQta());
	                query2.setDouble(4, prodotto.getCosto());
	                query2.executeUpdate();
	            }

	            con.commit();
	            carrello.getCarrello().clear();
	        }
	    } catch (Exception e) {
	        if (con != null) {
	            con.rollback();
	        }
	        System.out.println(e.getMessage());
	    } finally {
	        if (con != null) {
	            con.setAutoCommit(true);
	            DriverManagerConnectionPool.releaseConnection(con);
	        }
	    }
	    return carrello;
	}
*/

	public synchronized CarrelloBean acquista(CarrelloBean carrello, UtenteBean utente, String Destinazione) throws SQLException {
	    Connection con = null;
	    Collection<ProdottoBean> carrellobean = carrello.getCarrello();
	    String sql = "INSERT INTO Ordine (IdOrdine, Utente, Destinazione, Email, CostoTotale, DataOrdine) VALUES (?, ?, ?, ?, ?, current_date())";
	    String sql2 = "INSERT INTO ContieneProd (IdOrdine, IdProdotto, Qta, Costo) VALUES (?, ?, ?, ?)";
	    String sqlUpdateQuantita = "UPDATE Prodotto SET Qta = Qta - ? WHERE IdProdotto = ?";
	    Double prezzotot = 0.0;
	    String ordinecodice = null;

	    try {
	        con = DriverManagerConnectionPool.getConnection();
	        con.setAutoCommit(false); // Disable auto-commit for transaction management

	        if (carrellobean != null && !carrellobean.isEmpty()) {
	            // Codice univoco dell'ordine
	            ordinecodice = generateUniqueString();
	            ProdottoDAODataSource prodottoDAO = new ProdottoDAODataSource();

	            // Check if all products are available in required quantity
	            for (ProdottoBean prodotto : carrellobean) {
	                ProdottoBean prodottoDB = prodottoDAO.doRetrieveByKey(prodotto.getIdProdotto());
	                if (prodottoDB == null || prodotto.getQta() > prodottoDB.getQta()) {
	                    con.rollback();
	                    return carrello;
	                }
	            }

	            // Insert order details into Ordine table
	            for (ProdottoBean prodotto : carrellobean) {
	                prezzotot += prodotto.getCosto() * prodotto.getQta();
	            }

	            PreparedStatement query = con.prepareStatement(sql);
	            query.setString(1, ordinecodice); // Use a unique identifier for the order
	            query.setString(2, utente.getUsername());
	            query.setString(3, Destinazione);
	            query.setString(4, utente.getEmail());
	            query.setDouble(5, prezzotot);
	            query.executeUpdate();

	            // If all quantities are valid, proceed with order creation
	            for (ProdottoBean prodotto : carrellobean) {
	                // Insert product details into ContieneProd table
	                PreparedStatement query2 = con.prepareStatement(sql2);
	                query2.setString(1, ordinecodice); // Id Ordine
	                query2.setString(2, prodotto.getIdProdotto()); // Id Prodotto
	                query2.setInt(3, prodotto.getQta());
	                query2.setDouble(4, prodotto.getCosto());
	                query2.executeUpdate();

	                // Update product quantity in Prodotto table
	                PreparedStatement updateQuantita = con.prepareStatement(sqlUpdateQuantita);
	                updateQuantita.setInt(1, prodotto.getQta());
	                updateQuantita.setString(2, prodotto.getIdProdotto());
	                updateQuantita.executeUpdate();
	            }

	            con.commit();
	            carrello.getCarrello().clear();
	        }
	    } catch (Exception e) {
	        if (con != null) {
	            con.rollback();
	        }
	        System.out.println(e.getMessage());
	    } finally {
	        if (con != null) {
	            con.setAutoCommit(true);
	            DriverManagerConnectionPool.releaseConnection(con);
	        }
	    }
	    return carrello;
	}

	
	public synchronized void updateProductQuantity(String idProdotto, int newQuantity) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    try {
	    	connection = DriverManagerConnectionPool.getConnection();
	        String updateSQL = "UPDATE " + "Prodotto" + " SET Qta = ? WHERE IdProdotto = ?";
	        preparedStatement = connection.prepareStatement(updateSQL);
	        preparedStatement.setInt(1, newQuantity);
	        preparedStatement.setString(2, idProdotto);
	        preparedStatement.executeUpdate();
	        connection.commit();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }
	}




	/*
	public synchronized CarrelloBean aggiungiAlCarrello(CarrelloBean carrello, String idprodotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;		

		ProdottoBean prodotto = new ProdottoBean();

		String selectSQL = "SELECT * FROM Prodotto WHERE IdProdotto = ? AND Disponibile = true";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idprodotto);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				if(rs.getString("TipoProdotto").equals("Console")){
					prodotto.setIdProdotto(rs.getString("IdProdotto"));
					prodotto.setNome(rs.getString("Nome"));
					prodotto.setQta(rs.getInt("Qta"));
					prodotto.setCosto(rs.getFloat("Costo"));
					prodotto.setProduttore(rs.getString("Produttore"));
					prodotto.setDescr(rs.getString("Descrizione"));
				}else if (rs.getString("TipoProdotto").equals("Videogioco")) {
					prodotto.setIdProdotto(rs.getString("IdProdotto"));
					prodotto.setNome(rs.getString("Nome"));
					prodotto.setQta(rs.getInt("Qta"));
					prodotto.setCosto(rs.getFloat("Costo"));
					prodotto.setProduttore(rs.getString("Produttore"));
					prodotto.setGenere(rs.getString("Genere"));
					prodotto.setPiattaforma(rs.getString("Piattaforma"));
					prodotto.setTipoGioco(rs.getString("TipoGioco"));
					prodotto.setEdizione(rs.getString("Edizione"));
					prodotto.setDescr(rs.getString("Descrizione"));
				}else if (rs.getString("TipoProdotto").equals("Collezionabile")) {
					prodotto.setIdProdotto(rs.getString("IdProdotto"));
					prodotto.setNome(rs.getString("Nome"));
					prodotto.setQta(rs.getInt("Qta"));
					prodotto.setCosto(rs.getFloat("Costo"));
					prodotto.setProduttore(rs.getString("Produttore"));
					prodotto.setEdizione(rs.getString("Edizione"));
					prodotto.setCategoria(rs.getString("Categoria"));
					prodotto.setDescr(rs.getString("Descrizione"));
				}
			}
			//carrello.setCarrello(prodotto);
			return carrello;
		}
		catch (Exception e) {
			return carrello;
		}
		finally {
			if (connection != null) {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	*/
	
	public static String generateUniqueString() {
        final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        final int STRING_LENGTH = 10;
        SecureRandom random = new SecureRandom();
        
        StringBuilder sb = new StringBuilder(STRING_LENGTH);
        for (int i = 0; i < STRING_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(randomIndex));
        }
        return sb.toString();
    }
}
