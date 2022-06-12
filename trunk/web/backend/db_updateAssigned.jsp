<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../dbconnect.jsp" %>
<%@page import="java.util.*"%>

<%
    String url = "/trunk/project_feed.jsp";
    try{
        String assign = (String)request.getParameter("assign");
        String id = (String)request.getParameter("bug_id2");
        String id2 = (String)session.getAttribute("id");
        String query = "UPDATE bug  SET assigned_to='" + assign +"' "+ "where id='" + id + "'";
        stmt.executeUpdate(query);
        query = "UPDATE bug  SET assigned_by='" + id2 +"' "+ "where id='" + id + "'";
        stmt.executeUpdate(query);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}
    catch(Exception e){
            out.println(e);
            }
%>
