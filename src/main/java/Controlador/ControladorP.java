/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Carrito;
import Modelo.Cliente;
import Modelo.DetallePedido;
import Modelo.Pedido;
import Modelo.PedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author WALTER
 */
public class ControladorP extends HttpServlet {
    
    private PedidoDAO pedidoDao = new PedidoDAO();
    private Carrito objcarrito = new Carrito();
    private final String pagLogin = "Login.jsp";
    private final String pagCarrito = "PagCarrito.jsp";
    private final String pagMisPedidos = "PagMisPedidos.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        
        switch (accion) {
            case "procesar":
                Procesar(request, response);
                break;
                case "mis_pedidos":
                    MisPedidos(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }
    
    protected void MisPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.getRequestDispatcher(pagMisPedidos).forward(request, response);
    }
    
    protected void Procesar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getSession().getAttribute("usuario") != null) {
            Pedido objPed = new Pedido();
            Cliente objCli = (Cliente) request.getSession().getAttribute("usuario");
            ArrayList<DetallePedido> lista = objcarrito.ObtenerSesion(request);
            double total = objcarrito.ImporteTotal(lista);
            
            objPed.setCliente(objCli);
            objPed.setDetalles(lista);
            objPed.setTotal(total);
            objPed.setEstado("Pendiente");
            int result = pedidoDao.GenerarPedido(objPed);
            
            if(result > 0){
                objcarrito.GuardarSesion(request, new ArrayList<DetallePedido>());
                request.getSession().setAttribute("saccess", 
                        "Pedido procesado de forma correcta");
                response.sendRedirect("ControladorP?accion=mis_pedidos");
            }else{
            request.getSession().setAttribute("error", 
                    "Nose pudo procesar pedido");
            request.getRequestDispatcher(pagCarrito).forward(request, response);
            }
        }else{
            request.getSession().setAttribute("error", "Debe autentificarse primero"
                    + " antes de procesar su compra");
            request.getRequestDispatcher("pagLogin").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
