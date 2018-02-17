/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datasource;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author PIYUSH AHUJA
 */
public class MyConnection {
   public static Connection myConnectoin(){
        Connection con = null;
           try{
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Drivers Loaded successfully...");
        
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Online Test Paper Generation", "root", "root");
                System.out.println("Connection established...");
            }
            catch(ClassNotFoundException | SQLException e){
                System.out.println(e);
    }
    return con;
 }
    
}
