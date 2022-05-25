<%@ page import = "java.sql.*,java.io.*"%>

<%! 
        public class DBConnect{
                public void openDB(){
                        PrintWriter out = new PrintWriter (response.getOutputStream ());
                        try{
                                Class.forName("com.mysql.cj.jdbc.Drivers");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ninja","root","");      
                        }
                        catch(Exception e){
                                out.println(e);
                        }
                }
        }

%>
        
        
        
        
        
        <%--<%! public static void openDB(){
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ninja","root","");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from user");    
        }
        catch(Exception e){
                        java.io.out.println(e);
                }}
        %>--%>

    </body>
</html>


