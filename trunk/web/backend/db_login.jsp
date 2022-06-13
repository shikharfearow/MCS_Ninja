<%@include file="../dbconnect.jsp" %>
<%@page import="java.util.*"%>
<%String email =(String)request.getParameter("email");
      String pass = (String)request.getParameter("password");
      if(email.equals("") || pass.equals("")){
                                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "/trunk/login.jsp"); 
                        session.setAttribute("log_error","yes");
        }
      String query = "Select * from user where email='"+email+"'";
      String url = "/trunk/home.jsp";
      rs = stmt.executeQuery(query);
      try{
      if(rs.next()){
                if(rs.getString("password").equals(pass)){
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", url); 
                        session.setAttribute("name",rs.getString("name"));
                        session.setAttribute("email",rs.getString("email"));
                        session.setAttribute("role",rs.getString("roleid"));
                        session.setAttribute("id",rs.getString("id"));
                }
                else{
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "/trunk/login.jsp"); 
                        session.setAttribute("log_error","yes");
                }
        }
        else{
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "/trunk/login.jsp"); 
                        session.setAttribute("log_error","yes");
        }
        }
        catch(Exception e){
            out.println(e);
        }
      con.close();
%>
