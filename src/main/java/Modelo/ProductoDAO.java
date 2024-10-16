/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author PC-20
 */
public class ProductoDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public ArrayList<Producto> ListaTodos(){
    ArrayList<Producto> lista  = new ArrayList<Producto>();
        try {
            cn = Conexion.getConnection();
            String sql = "select * from Producto";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                Producto obj = new Producto();
                obj.setId_pro(rs.getInt("id_prod"));
                obj.setNom(rs.getString("nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                lista.add(obj);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
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
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return lista;
    }
}
