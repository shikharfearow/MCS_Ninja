
package javaapplication3;
import java.sql.*;
public class JavaApplication3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = null;
            conn = DriverManager.getConnection("jdbc:mysql://localhost/ninja","root", "");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from user");
            while(rs.next()){
                    System.out.println(rs.getString("name"));
            }
            conn.close();
        }
        catch(Exception e) {
            System.out.print("Do not connect to DB - Error:"+e);
        }
    }
    
}
