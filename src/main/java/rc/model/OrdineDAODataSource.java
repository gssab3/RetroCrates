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
	    String insertSQL = "INSERT INTO " + TABLE_NAME
	            + " (IdOrdine, Utente, Destinazione, Email, Data) VALUES (?, ?, ?, ?, ?)";
	    String selectSQL2 = "SELECT SUM(Costo) AS Costo FROM ContieneProd WHERE IdOrdine = ?";
	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL);
	        preparedStatement.setString(1, ordine.getIdOrdine());
	        preparedStatement.setString(2, ordine.getUtente());
	        preparedStatement.setString(3, ordine.getDestinazione());
	        preparedStatement.setString(4, ordine.getEmail());
	        preparedStatement.setString(5,  ordine.getDataOrdine());
	        preparedStatement.executeUpdate();
	        connection.commit();

	        // Execute the second query to get the total cost specific for this order
	        try (PreparedStatement secondStatement = connection.prepareStatement(selectSQL2)) {
	            secondStatement.setString(1, ordine.getIdOrdine());
	            ResultSet secondRs = secondStatement.executeQuery();
	            if (secondRs.next()) {
	                float costoTotale = secondRs.getFloat("Costo");
	                ordine.setCostoTotale(costoTotale);
	            }
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
	    String selectSQL2 = "SELECT SUM(Costo) AS Costo FROM ContieneProd WHERE IdOrdine = ?";
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
	            bean.setDataOrdine(rs.getString("DataOrdine"));

	            // Execute the second query to get the total cost specific for this order
	            try (PreparedStatement secondStatement = connection.prepareStatement(selectSQL2)) {
	                secondStatement.setString(1, bean.getIdOrdine());
	                ResultSet secondRs = secondStatement.executeQuery();
	                if (secondRs.next()) {
	                	float costoTotale = secondRs.getFloat("CostoTotale");
		                bean.setCostoTotale(costoTotale);
	                }
	            }
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
	    String selectSQL2 = "SELECT SUM(Costo) AS Costo FROM ContieneProd WHERE IdOrdine = ?";

	    if (order != null && !order.equals("")) {
	        selectSQL += " ORDER BY " + order;
	    }

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            OrdineBean bean = new OrdineBean();

	            bean.setIdOrdine(rs.getString("IdOrdine"));
	            bean.setUtente(rs.getString("Utente"));
	            bean.setDestinazione(rs.getString("Destinazione"));
	            bean.setEmail(rs.getString("Email"));
	            bean.setDataOrdine(rs.getString("DataOrdine"));
	            bean.setCostoTotale(rs.getFloat("CostoTotale"));

	            // Esegui la seconda query per ottenere il costo totale specifico per questo ordine
	            try (PreparedStatement secondStatement = connection.prepareStatement(selectSQL2)) {
	                secondStatement.setString(1, bean.getIdOrdine());
	                ResultSet secondRs = secondStatement.executeQuery();
	                if (secondRs.next()) {
	                	float costoTotale = secondRs.getFloat("Costo");
		                bean.setCostoTotale(costoTotale);
	                }
	            }

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

	
	public Collection<OrdineBean> doRetrieveDateByDate(String datex, String datey) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();

	    String selectSQL = "SELECT * FROM " + TABLE_NAME;
	    if (datex != null && datey != null) {
	        selectSQL += " WHERE DataOrdine >= ? AND DataOrdine <= ?";
	    } else if (datex != null) {
	        selectSQL += " WHERE DataOrdine >= ?";
	    } else if (datey != null) {
	        selectSQL += " WHERE DataOrdine <= ?";
	    }

	    String selectSQL2 = "SELECT SUM(Costo) AS Costo FROM ContieneProd WHERE IdOrdine = ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);

	        if (datex != null && datey != null) {
	            preparedStatement.setDate(1, java.sql.Date.valueOf(datex));
	            preparedStatement.setDate(2, java.sql.Date.valueOf(datey));
	        } else if (datex != null) {
	            preparedStatement.setDate(1, java.sql.Date.valueOf(datex));
	        } else if (datey != null) {
	            preparedStatement.setDate(1, java.sql.Date.valueOf(datey));
	        }

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            OrdineBean bean = new OrdineBean();

	            bean.setIdOrdine(rs.getString("IdOrdine"));
	            bean.setUtente(rs.getString("Utente"));
	            bean.setDestinazione(rs.getString("Destinazione"));
	            bean.setEmail(rs.getString("Email"));
	            bean.setDataOrdine(rs.getString("DataOrdine"));

	            // Execute the second query to get the total cost specific for this order
	            try (PreparedStatement secondStatement = connection.prepareStatement(selectSQL2)) {
	                secondStatement.setString(1, bean.getIdOrdine());
	                ResultSet secondRs = secondStatement.executeQuery();
	                if (secondRs.next()) {
	                    float costoTotale = secondRs.getFloat("Costo");
	                    bean.setCostoTotale(costoTotale);
	                }
	            }

	            ordini.add(bean);
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
	    return ordini;
	}


	public Collection<OrdineBean> doRetrieveByUser(String user) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();
	    String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE Utente = ?";
	    String selectSQL2 = "SELECT SUM(Costo) AS Costo FROM ContieneProd WHERE IdOrdine = ?";
	    try {
	        connection = ds.getConnection();    
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, user);
	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            OrdineBean bean = new OrdineBean();
	            bean.setIdOrdine(rs.getString("IdOrdine"));
	            bean.setUtente(rs.getString("Utente"));
	            bean.setDestinazione(rs.getString("Destinazione"));
	            bean.setEmail(rs.getString("Email"));
	            bean.setDataOrdine(rs.getString("DataOrdine"));

	            // Execute the second query to get the total cost specific for this order
	            try (PreparedStatement secondStatement = connection.prepareStatement(selectSQL2)) {
	                secondStatement.setString(1, bean.getIdOrdine());
	                ResultSet secondRs = secondStatement.executeQuery();
	                if (secondRs.next()) {
	                	float costoTotale = secondRs.getFloat("Costo");
		                bean.setCostoTotale(costoTotale);
	                }
	            }

	            ordini.add(bean);
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
	    return ordini;
	}
}
