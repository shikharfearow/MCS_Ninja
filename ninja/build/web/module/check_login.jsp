<%
        if(!(request.getRequestURI().equals(request.getContextPath()+"/login.jsp")) && session.getAttribute("id")==null ){
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "/trunk/login.jsp"); 
        }
%>
