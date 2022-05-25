<%@ page import = "java.sql.*,java.io.*"%>

<%
        Connection con = null;
        Statement stmt= null;
        ResultSet rs = null;
        try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost/ninja","root","");
                stmt=con.createStatement();
        }
        catch(Exception e){%>
        <h1>Can not connect</h1>
                <%}
%>


