<%-- 
    Document   : index
    Created on : 13-May-2022, 11:33:47 am
    Author     : 91942
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import = "java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
              <%
         // NLogin redirected
         String site = new String("/trunk/login.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
      %>
    </body>
</html>
