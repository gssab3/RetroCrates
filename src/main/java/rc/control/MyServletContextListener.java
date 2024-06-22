package rc.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Base64;


public class MyServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        updateImage("con0001", "base64encodedimage");
        updateImage("con0002", "base64encoded2img");
    }

    private void updateImage(String idProdotto, String base64Image) {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/retrocrates");
            try (Connection connection = ds.getConnection()) {
                String insertSQL = "UPDATE Prodotto SET Foto = ? WHERE IdProdotto = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
                    byte[] decodedBytes = Base64.getDecoder().decode(base64Image);
                    InputStream binaryStream = new ByteArrayInputStream(decodedBytes);
                    preparedStatement.setBinaryStream(1, binaryStream);
                    preparedStatement.setString(2, idProdotto);
                    preparedStatement.executeUpdate();
                    connection.commit();
                }
            }
        } catch (NamingException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Codice da eseguire alla chiusura dell'applicazione
    }
}
