<%-- 
    Document   : db_user
    Created on : 31-May-2022, 1:27:02 am
    Author     : 91942
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../dbconnect.jsp" %>
<%@page import="java.util.*"%>

<%
    String url = "/trunk/user.jsp";
    try{
        String name = (String)request.getParameter("name");
        String emp_des = (String)request.getParameter("emp_des");
        String email =(String)request.getParameter("email");
        String pass = (String)request.getParameter("password");
        int role = Integer.parseInt((String)request.getParameter("role"));
        String phone = (String)request.getParameter("phone");
        String jod = (String)request.getParameter("jod");
        String emp_code = name.substring(0,3) + phone.substring(phone.length()-3);
        String query = "insert into user (name,email,password,roleid,phone,active,emp_code,emp_designation,joining_date) values('" + 
                                name + "','" + email +"','" + pass +"','" +role +"','" + phone + "','" + 1 + "','" + emp_code + "','" +emp_des +"','" + jod + "')" ;
        stmt.executeUpdate(query);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url); 
}
    catch(Exception e){
            out.println(e);
            }
%>

