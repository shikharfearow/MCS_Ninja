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
        String start_date = (String)request.getParameter("Start-date");
        String end_date =(String)request.getParameter("End-date");
        String priority = (String)request.getParameter("priority");
        String file = (String)request.getParameter("file");
        String phase = (String)request.getParameter("phase");
        String detail=(String)request.getParameter("detail");
        
        String query = "insert into project (name,start_date,end_date,priority,tech,phase,details) values('" + 
                                name + "','" + start_date +"','" + end_date +"','" +priority +"','" + "JSP" + "','" + phase  + "','"+ detail +"')" ;
        stmt.executeUpdate(query);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}
    catch(Exception e){
            out.println(e);
            }
%>

