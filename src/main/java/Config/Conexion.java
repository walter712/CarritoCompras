/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author PC-20
 */
public class Conexion {
    private static String database = "bd_carrito";
    private static String username = "root";
    private static String password = "";
    private static String url = "jdbc:mysql://localhost:3306/" + database;
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
             Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url, username, password);
            System.out.println("Conexion aceptada...");
        } catch (Exception e) {
            System.out.println("Mensaje de error"+e);
            JOptionPane.showInputDialog(null,"no se pudo conectar");
        }
        return conn;
    }
    
}
