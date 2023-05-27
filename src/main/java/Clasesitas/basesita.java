package Clasesitas;

import java.sql.Connection;
import java.sql.DriverManager;

public class basesita {
    
    public static final String URL = "jdbc:mysql://127.0.0.1:3308/dennoun";
    public static final String USER = "root";
    public static final String CLAVE = "n0m3l0";
     
    public Connection getConexion(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(URL, USER, CLAVE);
        }catch(Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return con;
    }
    
}
