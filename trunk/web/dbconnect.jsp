<%@ page import = "java.sql.*,java.io.*"%>

<%
        Connection con = null;
        Statement stmt= null;
        Statement stmt2 = null;
        ResultSet rs = null;
        ResultSet rs3 = null;
        try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost/ninja","root","");
                stmt=con.createStatement();
                stmt2 = con.createStatement();
        }
        catch(Exception e){%>
        <h1>Can not connect</h1>
                <%}
%>


