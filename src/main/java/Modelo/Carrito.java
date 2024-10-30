/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author WALTER
 */
public class Carrito {
    public void AgregarCarrito(DetallePedido detalle, HttpServletRequest request){
        ArrayList<DetallePedido> lista = ObtenerSesion(request);
        int posc = ExisteProducto(lista, detalle.getProducto().getId_pro());
        
        if(posc == -1){
            lista.add(detalle);
        }else{
            DetallePedido objDet = lista.get(posc);
            objDet.AumentarCantidad(detalle.getCantidad());
            lista.set(posc, objDet);
        }
        GuardarSesion(request, lista);
    }
    
    public double ImporteTotal(ArrayList<DetallePedido> lista){
        double total = 0;
        for (DetallePedido item : lista) {
            total += item.Importe();
        }
        return total;
    }
    
    public void RemoverItemCarrito(HttpServletRequest request, int indice){
        ArrayList<DetallePedido> lista = ObtenerSesion(request);
        lista.remove(indice);
        GuardarSesion(request, lista);
    }
    
    public ArrayList<DetallePedido> ObtenerSesion(HttpServletRequest request){
        ArrayList<DetallePedido> lista;
        
        if(request.getSession().getAttribute("carrito")==null){
            lista = new ArrayList<>();
        }else{
            lista = (ArrayList<DetallePedido>) request.getSession().getAttribute("carrito");
        }
        return lista;
    }
    
    public void GuardarSesion(HttpServletRequest request, ArrayList<DetallePedido> lista){
        request.getSession().setAttribute("carrito", lista);
    }
    
    public int ExisteProducto(ArrayList<DetallePedido> lista, int idProd){
        
        for (int i = 0; i < lista.size(); i++) {
            if(lista.get(i).getProducto().getId_pro() == idProd){
            return i;
            }
        }
        return -1;
    }
}
