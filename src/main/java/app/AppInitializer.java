package app;

import Modelo.ProductoDAO;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitializer implements ServletContextListener{
    private ProductoDAO prodDAO = new ProductoDAO();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("productos", prodDAO.ListaTodos());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
    
}
