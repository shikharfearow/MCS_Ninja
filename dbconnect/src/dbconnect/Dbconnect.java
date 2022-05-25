package dbconnect;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class Dbconnect {
        public static void main(String args[]) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/ninja");
            System.out.print("Database is connected !");
            conn.close();
        }
        catch(Exception e) {
            System.out.print("Do not connect to DB - Error:"+e);
        }
}
    
}
