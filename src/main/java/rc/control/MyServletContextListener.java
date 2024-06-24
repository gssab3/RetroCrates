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
        updateImage("coll001", "tlou2poster.png");
        updateImage("coll002", "tazzahalo.png");
        updateImage("coll003", "funkopacman.png");
        updateImage("coll004", "postersonic.png");
        updateImage("con0001", "ps5.png");
        updateImage("con0002", "xboxseriesxs.png");
        updateImage("con0003", "switch.png");
        updateImage("con0004", "atari2600.png");
        updateImage("con0005", "segamegadrive.png");
        updateImage("game001", "tlou2ps4.png");
        updateImage("game002", "OIP.jpg");
        updateImage("game003", "zelda.jpg");
        updateImage("game004", "pacmangame.png");
        updateImage("game005", "sonicgame.png");
    }

    private void updateImage(String idProdotto, String immagine) {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/retrocrates");
            try (Connection connection = ds.getConnection()) {
                String insertSQL = "UPDATE Prodotto SET Foto = ? WHERE IdProdotto = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
                    preparedStatement.setString(1, immagine);
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
