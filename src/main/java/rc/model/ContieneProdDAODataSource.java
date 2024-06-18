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

public class ContieneProdDAODataSource implements IBeanDAO<ContieneProdBean> {
	
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
	
	private static final String TABLE_NAME = "ContieneProd";
	
	@Override
	public synchronized void doSave(ContieneProdBean contiene) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdOrdine, IdProdotto, Qta, Costo) VALUES(?, ?, ?, ?)";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, contiene.getIdOrdine());
			preparedStatement.setString(2, contiene.getIdProdotto());
			preparedStatement.setInt(3, contiene.getQta());
			preparedStatement.setFloat(4, contiene.getCosto());
		
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

	//Non puoi eliminare qualcosa da un ordine... sarebbe illegale
	@Override
	public boolean doDelete(String code) throws SQLException {
		/*
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
		*/
		return false;
	}

	@Override
	public ContieneProdBean doRetrieveByKey(String code) throws SQLException {
		return null;
	}
	
	public ContieneProdBean doRetrieveByIdOrdine(String idordine) throws SQLException {
		return null;
	}
	
	public Collection<ContieneProdBean> doRetrieveByOrder(String idordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ContieneProdBean> contiene = new LinkedList<ContieneProdBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + "WHERE IdOrdine = ?";


		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ContieneProdBean bean = new ContieneProdBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setIdOrdine(rs.getString("IdOrdine"));
				bean.setQta(rs.getInt("Qta"));
				bean.setCosto(rs.getFloat("Costo"));
				
				contiene.add(bean);
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
		return contiene;	
	}

	@Override
	public Collection<ContieneProdBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ContieneProdBean> contiene = new LinkedList<ContieneProdBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ContieneProdBean bean = new ContieneProdBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setIdOrdine(rs.getString("IdOrdine"));
				bean.setQta(rs.getInt("Qta"));
				bean.setCosto(rs.getFloat("Costo"));
				
				contiene.add(bean);
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
		return contiene;		
	}
}