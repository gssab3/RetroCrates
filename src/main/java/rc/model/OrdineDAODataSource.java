package rc.model;

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

public class OrdineDAODataSource implements IBeanDAO<OrdineBean>{
	
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

	private static final String TABLE_NAME = "Ordine";

	@Override
	public synchronized void doSave(OrdineBean ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdOrdine, Utente, Destinazione, Email, Data) VALUES (?, ?, ?, ?, ?, ?)";
		 //Sony, Microsoft, Nintendo, Atari, Sega, Altri
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, ordine.getIdOrdine());
			preparedStatement.setString(2, ordine.getUtente());
			preparedStatement.setString(3, ordine.getDestinazione());
			preparedStatement.setString(4, ordine.getEmail());
			preparedStatement.setString(5,  ordine.getData());
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

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE IdOrdine = ?";

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
	public OrdineBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		OrdineBean bean = new OrdineBean();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE IdOrdine = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				bean.setIdOrdine(rs.getString("IdOrdine"));
				bean.setUtente(rs.getString("Utente"));
				bean.setDestinazione(rs.getString("Destinazione"));
				bean.setEmail(rs.getString("Email"));
				bean.setData(rs.getString("Data"));
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
	public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrdineBean> products = new LinkedList<OrdineBean>();

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
				OrdineBean bean = new OrdineBean();
				
				bean.setIdOrdine(rs.getString("IdOrdine"));
				bean.setUtente(rs.getString("Utente"));
				bean.setDestinazione(rs.getString("Destinazione"));
				bean.setEmail(rs.getString("Email"));
				bean.setEmail(rs.getString("Data"));
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
