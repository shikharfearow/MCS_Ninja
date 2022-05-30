<%
    String url = "/trunk/";
    
    try{
    if(session.getAttribute("role") == null){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url+"login.jsp");
    }
    if(session.getAttribute("role").equals("1")){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url+"user.jsp"); 
    }
    else if(session.getAttribute("role").equals("2") || session.getAttribute("role").equals("3")){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url+"project_feed.jsp");
    }
    else{
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", url+"login.jsp");
    }
    }
    catch(Exception e){
        out.println(e);
    }
%>
