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

public class RecensioneDAODataSource implements IBeanDAO<RecensioneBean>{
	
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

	private static final String TABLE_NAME = "Recensione";

	@Override
	public synchronized void doSave(RecensioneBean recensione) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdRecensione, Utente, Videogioco, Console, Collezionabile, Stelle, Descrizione) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, recensione.getIdRecensione());
			preparedStatement.setString(2, recensione.getUtente());
			preparedStatement.setString(3, recensione.getVideogioco());
			preparedStatement.setString(4, recensione.getConsole());
			preparedStatement.setString(5, recensione.getCollezionabile());
			preparedStatement.setFloat(6, recensione.getStelle());
			preparedStatement.setString(7, recensione.getDescrizione());
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
	public RecensioneBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		RecensioneBean bean = new RecensioneBean();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE CODE = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				bean.setIdRecensione(rs.getString("IdRecensione"));
				bean.setUtente(rs.getString("Utente"));
				bean.setVideogioco(rs.getString("Videogioco"));
				bean.setConsole(rs.getString("Console"));
				bean.setCollezionabile(rs.getString("Collezionabile"));
				bean.setStelle(rs.getFloat("Stelle"));
				bean.setDescrizione(rs.getString("Descrizione"));
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
	public Collection<RecensioneBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<RecensioneBean> products = new LinkedList<RecensioneBean>();

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
				RecensioneBean bean = new RecensioneBean();
				
				bean.setIdRecensione(rs.getString("IdRecensione"));
				bean.setUtente(rs.getString("Utente"));
				bean.setVideogioco(rs.getString("Videogioco"));
				bean.setConsole(rs.getString("Console"));
				bean.setCollezionabile(rs.getString("Collezionabile"));
				bean.setStelle(rs.getFloat("Stelle"));
				bean.setDescrizione(rs.getString("Descrizione"));
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
