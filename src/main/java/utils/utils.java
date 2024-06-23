package utils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class utils {
	public static String formatta(String s) {
		String result = "";
		for(int i=0; i<s.length(); i++) {
			if(s.charAt(i) == '_')
				result = result+" ";
			else
				result = result+s.charAt(i);
		}
		return result;
		
		
	}
	
	public static void updateImage(String idProdotto, String base64Image) {
	    try {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context) initCtx.lookup("java:comp/env");
	        DataSource ds = (DataSource) envCtx.lookup("jdbc/retrocrates");

	        try (Connection connection = ds.getConnection()) {
	            String updateSQL = "UPDATE Prodotto SET Foto = ? WHERE IdProdotto = ?";
	            try (PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
	                byte[] decodedBytes = Base64.getDecoder().decode(base64Image);
	                try (InputStream binaryStream = new ByteArrayInputStream(decodedBytes)) {
	                    preparedStatement.setBinaryStream(1, binaryStream);
	                    preparedStatement.setString(2, idProdotto);
	                    preparedStatement.executeUpdate();
	                    connection.commit();
	                } catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	            }
	        }
	    } catch (NamingException | SQLException e) {
	        // Gestisci l'errore in modo appropriato, ad esempio:
	        e.printStackTrace();
	    }
	}

}
