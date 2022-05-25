<%@include file="../dbconnect.jsp" %>

<%String email =(String)request.getParameter("email");
      String pass = (String)request.getParameter("password");
      String query = "Select password from user where email='"+email+"'";
      String url = "/trunk/home.jsp";
      rs = stmt.executeQuery(query);
      if(rs.next()){
                if(rs.getString("password").equals(pass)){
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", url); 
                        session.setAttribute("user","yes");
                }
                else{
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "/trunk/login.jsp"); 
                        session.setAttribute("log_error","yes");
                }
        }
      con.close();
%>
