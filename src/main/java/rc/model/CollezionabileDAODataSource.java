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

public class CollezionabileDAODataSource implements IBeanDAO<CollezionabileBean>{
	
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

	private static final String TABLE_NAME = "collezionabile";

	@Override
	public synchronized void doSave(CollezionabileBean collezionabile) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (IdProdotto, Nome, Qta, Disponibile, Descrizione, Categoria, Costo, Produttore, Edizione, Foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 //Sony, Microsoft, Nintendo, Atari, Sega, Altri
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, collezionabile.getIdProdotto());
			preparedStatement.setString(2, collezionabile.getNome());
			preparedStatement.setInt(3, collezionabile.getQta());
			preparedStatement.setBoolean(4, collezionabile.isDisp());
			preparedStatement.setString(5, collezionabile.getDescr());
			preparedStatement.setString(6, collezionabile.getCategoria());
			preparedStatement.setFloat(7, collezionabile.getCosto());
			preparedStatement.setString(8, collezionabile.getProduttore());
			preparedStatement.setString(9, collezionabile.getEdizione());
			preparedStatement.setBlob(10,  collezionabile.getPicture());
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
	public CollezionabileBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		CollezionabileBean bean = new CollezionabileBean();
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
	public Collection<CollezionabileBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<CollezionabileBean> products = new LinkedList<CollezionabileBean>();

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
				CollezionabileBean bean = new CollezionabileBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
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
