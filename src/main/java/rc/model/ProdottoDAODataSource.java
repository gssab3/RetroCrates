package rc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.awt.image.BufferedImage;


public class ProdottoDAODataSource implements IBeanDAO<ProdottoBean> {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/retrocrates");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "Prodotto";

	@Override
	public synchronized void doSave(ProdottoBean prodotto) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdProdotto, Nome, Descrizione, Qta, Disponibile, Foto, Costo, stelleTot, Produttore, Genere, Piattaforma, TipoGioco, TipoProdotto, Categoria, Edizione) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, prodotto.getIdProdotto());
			preparedStatement.setString(2, prodotto.getNome());
			preparedStatement.setString(3, prodotto.getDescr());
			preparedStatement.setInt(4, prodotto.getQta());
			preparedStatement.setBoolean(5, prodotto.isDisp());
			preparedStatement.setBlob(6, prodotto.getPicture());
			preparedStatement.setFloat(7, prodotto.getCosto());
			preparedStatement.setInt(8, prodotto.getStelleTot());
			preparedStatement.setString(9, prodotto.getProduttore());
			preparedStatement.setString(10, prodotto.getGenere());
			preparedStatement.setString(11, prodotto.getPiattaforma());
			preparedStatement.setString(12,  prodotto.getTipoGioco());
			preparedStatement.setString(13, prodotto.getTipoProdotto());
			preparedStatement.setString(14,  prodotto.getCategoria());
			preparedStatement.setString(15, prodotto.getEdizione());
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

	@Override
	public synchronized boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE IdProdotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			result = preparedStatement.executeUpdate();
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
		return (result != 0);
	}

	@Override
	public synchronized Collection<ProdottoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int err=0;
				ProdottoBean bean = new ProdottoBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	
	public synchronized Collection<ProdottoBean> doRetrieveAllAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProdottoBean bean = new ProdottoBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				prodotti.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	@Override
	public synchronized ProdottoBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ProdottoBean bean = new ProdottoBean();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdProdotto = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	public synchronized Collection<ProdottoBean> doRetrieveByCategory(String category) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE TipoProdotto = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, category);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err = 0;
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	public synchronized Collection<ProdottoBean> doRetrieveByCategoryProducer(String category, String producer) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE TipoProdotto = ? AND Produttore = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, category);
			preparedStatement.setString(2, producer);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err = 0;
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	public synchronized Collection<ProdottoBean> doRetrieveByCategoryGenre(String category, String genre) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE TipoProdotto = ? AND Genere = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, category);
			preparedStatement.setString(2, genre);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err = 0;
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	public synchronized Collection<ProdottoBean> doRetrieveByCategoryColCat(String category, String cat) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE TipoProdotto = ? AND Categoria = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, category);
			preparedStatement.setString(2, cat);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err = 0;
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	
	public synchronized Collection<ProdottoBean> doRetrieveByName(String nome) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE LOWER(Nome) LIKE LOWER(?)";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, "%" + nome + "%");
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err = 0;
				ProdottoBean bean = new ProdottoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setStelleTot(rs.getInt("stelleTot"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setTipoGioco(rs.getString("TipoGioco"));
				bean.setTipoProdotto(rs.getString("TipoProdotto"));
				bean.setCategoria(rs.getString("Categoria"));
				bean.setEdizione(rs.getString("Edizione"));
				
				if(bean.isDisp() == false)
					err = 1;
				
				if(err == 0)
					prodotti.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return prodotti;
	}
	
	
}

