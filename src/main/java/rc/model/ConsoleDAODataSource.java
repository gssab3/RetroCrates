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
import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.IOException;


public class ConsoleDAODataSource implements IBeanDAO<ConsoleBean> {

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

	private static final String TABLE_NAME = "console";

	@Override
	public synchronized void doSave(ConsoleBean console) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int err = 0;
		BufferedImage image = null;
		String insertSQL = "INSERT INTO " + ConsoleDAODataSource.TABLE_NAME
				+ " (IdProdotto, Nome, Descrizione, Costo, Produttore, Qta, Disponibile, Foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		 //Sony, Microsoft, Nintendo, Atari, Sega, Altri
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, console.getIdProdotto());
			preparedStatement.setString(2, console.getNome());
			preparedStatement.setString(3, console.getDescr());
			preparedStatement.setFloat(4, console.getCosto());
			preparedStatement.setString(5, console.getProduttore());
			preparedStatement.setInt(6, console.getQta());
			preparedStatement.setBoolean(7, console.isDisp());
			preparedStatement.setBlob(8, console.getPicture());
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

		String deleteSQL = "DELETE FROM " + ConsoleDAODataSource.TABLE_NAME + " WHERE CODE = ?";

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
	public synchronized Collection<ConsoleBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ConsoleBean> products = new LinkedList<ConsoleBean>();

		String selectSQL = "SELECT * FROM " + ConsoleDAODataSource.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int err=0;
				ConsoleBean bean = new ConsoleBean();
				
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				if(bean.isDisp() == false)
					err = 1;
				
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				if(bean.getPicture() == null)
					err = 1;
				
				if(err == 1)
					bean = null;
				else
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
	
	@Override
	public synchronized ConsoleBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ConsoleBean bean = new ConsoleBean();
		String selectSQL = "SELECT * FROM " + ConsoleDAODataSource.TABLE_NAME + " WHERE CODE = ?";
		try {
			connection = ds.getConnection();	
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int err=0;
				bean.setIdProdotto(rs.getString("IdProdotto"));
				bean.setNome(rs.getString("Nome"));
				bean.setDescr(rs.getString("Descrizione"));
				bean.setCosto(rs.getFloat("Costo"));
				bean.setQta(rs.getInt("Qta"));
				bean.setDisp(rs.getBoolean("Disponibile"));
				if(bean.isDisp() == false)
					err = 1;
				
				bean.setPicture((com.mysql.cj.jdbc.Blob) rs.getBlob("Foto"));
				if(bean.getPicture() == null)
					err = 1;
				
				if(err == 1)
					bean = null;
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
}

