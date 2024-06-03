package VideogiocoBean;

import java.awt.image.BufferedImage;
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
import it.unisa.IBeanDAO;

public class VideogiocoDAODataSource implements IBeanDAO<VideogiocoBean>{
	
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

	private static final String TABLE_NAME = "videogioco";

	@Override
	public synchronized void doSave(VideogiocoBean videogioco) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdProdotto, Nome, Descrizione, Edizione, Costo, Qta, Disponibile, Genere, Piattaforma, Produttore, Tipo, Foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 //Sony, Microsoft, Nintendo, Atari, Sega, Altri
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, videogioco.getIdProdotto());
			preparedStatement.setString(2, videogioco.getNome());
			preparedStatement.setString(3, videogioco.getDescr());
			preparedStatement.setString(4, videogioco.getEdizione());
			preparedStatement.setFloat(5, videogioco.getCosto());
			preparedStatement.setInt(6, videogioco.getQta());
			preparedStatement.setBoolean(7, videogioco.isDisp());
			preparedStatement.setString(8, videogioco.getGenere());
			preparedStatement.setString(9, videogioco.getPiattaforma());
			preparedStatement.setString(10,  videogioco.getProduttore());
			preparedStatement.setString(11, videogioco.getTipo());
			preparedStatement.setBlob(12, videogioco.getPicture());
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
	public boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE CODE = ?";

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
	public VideogiocoBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		VideogiocoBean bean = new VideogiocoBean();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE CODE = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setEdizione(rs.getString("Edizione"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setTipo(rs.getString("Tipo"));
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

	@Override
	public Collection<VideogiocoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<VideogiocoBean> products = new LinkedList<VideogiocoBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				VideogiocoBean bean = new VideogiocoBean();
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				bean.setEdizione(rs.getString("Edizione"));
				bean.setGenere(rs.getString("Genere"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setProduttore(rs.getString("Produttore"));
				bean.setTipo(rs.getString("Tipo"));
				products.add(bean);
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
		return products;
	}
}
