<%-- 
    Document   : home
    Created on : 25-May-2022, 10:41:19 pm
    Author     : 91942
--%>

<%
        if(session.getAttribute("user") != null){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%}
else{
        String url = new String("/trunk/login.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}

%>