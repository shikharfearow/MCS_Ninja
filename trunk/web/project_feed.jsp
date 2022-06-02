<%-- 
    Document   : project_feed
    Created on : 30-May-2022, 7:52:03 pm
    Author     : 91942
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
  
    </head>
    <%@include  file="/module/nav_bar.jsp" %>
    <%@include file="/dbconnect.jsp" %>
    <body>
        <div class="salute">
            <h3>Welcome, <%=session.getAttribute("name")%></h3>
        </div>
        <div class="feed">
            <% if(session.getAttribute("role").equals("2")){ %>
        <div class="project_feed">
            <div class="feed_title">
                    
                <h3>PROJECTS</h3>
                    <a href="project.jsp">ADD PROJECT</a>
            </div>
                <%
                        rs = stmt.executeQuery("Select * from project");
                        while(rs.next()){
                %>
                <div class="project_item">
                    <h3>PROJECT ID:<%=rs.getString("id")%></h3>
                    <h3><%=rs.getString("name")%></h3>
                    <p>ETA:<%=rs.getString("end_date")%></p>
                    <p>Priority:
                        <%
                            if(rs.getString("priority").equals("1")){
                                out.println("High");
                            }
                            else if(rs.getString("priority").equals("2")){
                               out.println("Medium");
                            }
                            else if(rs.getString("priority").equals("3")){
                                out.println("low");
                            }
                        %></p>
                </div>
                <%}%>
        </div>
        <%}%>
            <div class="bug_feed">
             <div class="feed_title">
                    <h3>BUGS</h3>
                    <a href="bug.jsp">ADD BUGS</a>
            </div>
                <%
                        rs = stmt.executeQuery("Select * from bug,user where bug.assigned_to = user.id and bug.assigned_to="+session.getAttribute("id"));
                        while(rs.next()){
                %>
                        <div class="bug_item">
                            <h3>BUG ID:<%=rs.getString("id")%></h3>
                            <h3><%=rs.getString("name")%></h3>
                             <p>Start Date:<%=rs.getString("register_date")%></p>
                            <p>ETA:<%=rs.getString("solve_date")%></p>
                            <p>Assigned to:<%=rs.getString("user.name")%></p>
                            <p>Status:<%=rs.getString("status")%></p>
                    <p>Priority:
                        <%
                            if(rs.getString("priority").equals("1")){
                                out.println("<span style='color:red'>High</span>");
                            }
                            else if(rs.getString("priority").equals("2")){
                               out.println("<span style='color:orange'>Medium</span>");
                            }
                            else if(rs.getString("priority").equals("3")){
                                out.println("<span style='color:bllue'>Low</span>");
                            }
                        %></p>
                        </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
