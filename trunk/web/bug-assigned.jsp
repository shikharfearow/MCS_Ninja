<%-- 
    Document   : bug-assigned
    Created on : 28-May-2022, 10:08:36 AM
    Author     : IAmGroooooT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Bug Assigned Page</title>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/common.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/login.css"/>
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <div class="container">
                <form>
                    <div class="form-bug-assigned-bug">
                        <label for="Bug">Bug</label>
                        <select name="Bug">
                            <option value="">select</option>
                            <%
                                rs = stmt.executeQuery("Select * from bug INNER JOIN project ON project.id=bug.project_id where bug.status='new'");
                                while(rs.next()){
                                    out.print("<option value='"+rs.getString("bug.id")+"'>"+rs.getString("project.name")+"-->"+rs.getString("bug.name")+"</option>");
                                } 
                            %>
                        </select>
                    </div>
                    <div class="form-user-submit">
                        <input type="submit" value="Submit">
                    </div>
            </form>
                </div>
        </body>
</html>
<%@ include file="module/footer.jsp"%>