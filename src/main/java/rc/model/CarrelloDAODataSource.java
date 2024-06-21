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
	
	public synchronized CarrelloBean acquista(CarrelloBean carrello, UtenteBean utente, String Destinazione) throws SQLException {
		Connection con = null;
		Collection<ProdottoBean> carrellobean = carrello.getCarrello();
		String sql = "INSERT INTO Ordine (IdOrdine, Utente, Destinazione, Email, CostoTotale, DataOrdine) VALUES (?, ?, ?, ?,?, current_date())";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			
			if (carrellobean != null && carrellobean.size() != 0) {
				for (Iterator<ProdottoBean> i = carrello.getCarrello().iterator(); i.hasNext();) {
					ProdottoBean prodotto = (ProdottoBean) i.next();
					Double prezzoTot = (double) (prodotto.getCosto() * prodotto.getQta());
					
					PreparedStatement query = con.prepareStatement(sql);
					query.setString(1, generateUniqueString());
					query.setString(2, utente.getUsername());
					query.setString(3, Destinazione);
					query.setString(4, utente.getEmail());
					query.setDouble(5, prezzoTot);
					
					
					query.executeUpdate();
				}
				con.commit();
				//carrello.removeAllItems();
			}
			return carrello;
		}
		catch (Exception e) {
			return carrello;
		}
		finally {
			if (con != null) {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}	
	}
	
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
