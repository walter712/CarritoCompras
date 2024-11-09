/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WALTER
 */
public class PedidoDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int GenerarPedido(Pedido obj){
        int result = 0;
        try {
            cn = Conexion.getConnection();
            cn.setAutoCommit(false);
            String sql = "INSERT INTO pedido(id_cli, fecha_ped, total, estado) VALUES(?,NOW(),?,?)";
            ps = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, obj.getCliente().getIdCliente());
            ps.setDouble(2, obj.getTotal());
            ps.setString(3, obj.getEstado());
            result = ps.executeUpdate();
            
            if(result >0){
                rs = ps.getGeneratedKeys();
                
                if(rs.next()){
                    int idPed = rs.getInt(1);
                    
                    ps = cn.prepareStatement("INSERT INTO Detalle_Pedido"
                            + "(id_ped,id_prod,precio,cantidad) VALUES(?,?,?,?)");
                    for(DetallePedido carrito: obj.getDetalles()){
                    ps.setInt(1, idPed);
                    ps.setInt(2, carrito.getProducto().getId_pro());
                    ps.setDouble(3, carrito.getProducto().getPrecio());
                    ps.setInt(4, carrito.getCantidad());
                    ps.executeUpdate();
                    }
                    cn.commit();
                }
            }
        } catch (Exception ex) {
            try {
                if(cn != null){
                cn.rollback();
                result = 0;
                }
            } catch (SQLException ex1) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if(cn != null){
                cn.close();
                }
                if(ps != null){
                ps.close();
                }
                if(rs != null){
                rs.close();
                }
            } catch (Exception e) {
            }
        }
        return result;
    }
}
