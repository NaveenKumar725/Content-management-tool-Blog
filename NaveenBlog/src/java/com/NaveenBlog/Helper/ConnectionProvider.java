
 package com.NaveenBlog.Helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;   
    public static Connection getConnection()   //Created one method which will return con
    {
        try {                   
        if (con == null) {    
                //driver class load 
                Class.forName("com.mysql.cj.jdbc.Driver");
                //create a connection
                String url="jdbc:mysql://localhost:3306/naveenblog";
                String username="root";
                String password="";
                con=DriverManager.getConnection(url, username, password);
           
        }   
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;

    }
}
//package com.NaveenBlog.Helper;
//import java.sql.*;

//public class ConnectionProvider {
// private static Connection con;
// public static Connection getConnection(){
//       try{
//           
//        if(con==null){
//               //load driver class
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            //create a connection
//            con=DriverManager.getConnection("  jdbc:mysql://localhost:3306/naveenblog","root", "");
//
//        }
// }catch(Exception e){
//     e.printStackTrace();
// }
// return con;
// }
// 
//}
















