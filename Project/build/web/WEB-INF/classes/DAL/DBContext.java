/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create Connection String
        String url="jdbc:sqlserver:"
                + "//localhost:1433"
                + ";databaseName=SWP_project;encrypt=true;trustServerCertificate=true";
        //3. Open Connection
        Connection con=DriverManager.getConnection(url,"sa","datvip01ht");
        return con;
    }
}