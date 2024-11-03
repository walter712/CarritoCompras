/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author PC-05
 */
public class ClienteDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int Guardar(Cliente obj){
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "insert into cliente(nombres,apellidos,telefono,correo,password)"
                    + " values(?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, obj.getNombres().trim());
            ps.setString(2, obj.getApellidos().trim());
            ps.setString(3, obj.getTelefono().trim());
            ps.setString(4, obj.getCorreo().trim());
            ps.setString(5, obj.getPassword());
            
            result = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                if(cn != null){
                    cn.close();
                }if(ps != null){
                    ps.close();
                }
            } catch (Exception e) {
            }
        }
        return result;
    }
    
    public boolean ExisteCorreo(String correo){
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "select count(1) from cliente where correo = ?";
            ps = cn.prepareCall(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            
            if(rs.next()){
                return (rs.getInt(1)>0);
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally{
            try {
                if(cn != null){
                    cn.close();
                }if(ps != null){
                    ps.close();
                }if(rs != null){
                    rs.close();
                }
            } catch (Exception e) {
            }
        }
        return false;
    }
}
