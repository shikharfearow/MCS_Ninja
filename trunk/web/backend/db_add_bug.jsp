<%-- 
    Document   : db_user
    Created on : 31-May-2022, 1:27:02 am
    Author     : 91942
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../dbconnect.jsp" %>
<%@page import="java.util.*"%>

<%
    String url = "/trunk/project_feed.jsp";
    try{
        String name = (String)request.getParameter("name");
        String register_date = (String)request.getParameter("register-date");
        String solve_date =(String)request.getParameter("solve-date");
        String status = (String)request.getParameter("status");
        int project = Integer.parseInt(request.getParameter("project"));
        String priority = (String)request.getParameter("priority");
        String detail = (String)request.getParameter("detail");
        String comment = (String)request.getParameter("comment");
        String assigned_to = (String)request.getParameter("assign");
        String assigned_by = (String)session.getAttribute("id");
        String query = "insert into bug (name,register_date,solve_date,status,project_id,priority,detail,comment,assigned_to,assigned_by,assigned_date) values('" + 
                                name + "','" + register_date +"','" + solve_date +"','" +status +"','" + project + "','" + priority  + "','" + detail + "','" + comment + "','" + assigned_to + "','" + assigned_by +"','" + register_date + "')" ;
        stmt.executeUpdate(query);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}
    catch(Exception e){
            out.println(e);
            }
%>

