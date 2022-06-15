<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../dbconnect.jsp" %>
<%@page import="java.util.*"%>

<%
    String url = "/ninja/project_feed.jsp";
    try{
        String status = (String)request.getParameter("status");
        String id = (String)request.getParameter("bug_id");
        String query = "UPDATE bug  SET status='" + status +"' "+ "where id='" + id + "'";
        stmt.executeUpdate(query);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}
    catch(Exception e){
            out.println(e);
            }
%>
