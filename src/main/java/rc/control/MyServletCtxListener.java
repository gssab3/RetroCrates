package rc.control;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

public class MyServletCtxListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
	}
	
	
	@Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Codice da eseguire alla chiusura dell'applicazione
    }
}
