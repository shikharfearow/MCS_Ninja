<%-- 
    Document   : bug
    Created on : 26-May-2022, 3:43:36 PM
    Author     : IAmGroooooT
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Bug Page</title>
                <link rel="shortcut icon" href="${pageContext.request.contextPath}/login_res/ninja.jpg">
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/common.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <div class="container">
                    <form action="backend/db_add_bug.jsp" method="post">
                    <div class="form-bug-name">
                        <label for="name">Name</label>
                        <input type="text" name="name"> 
                    </div>
                    <div class="form-bug-status">
                        <label for="status">Status</label>
                        <select name="status">
                            <option value="">Select</option>
                            <option value="New">New</option>
                            <option value="Assigned">Assigned</option>
                            <option value="Open">Open</option>
                            <option value="Fixed">Fixed</option>
                            <option value="Pending retest">Pending retest</option>
                            <option value="Retest">Retest</option>
                        </select>
                    </div>
                    <div class="form-bug-register_date">
                       <label for="register_date">Register Date</label>
                       <input type="date" name="register-date"> 
                    </div>
                    <div class="form-bug-solve-date">
                       <label for="solve-date">Solve Date</label>
                       <input type="date" name="solve-date"> 
                    </div>
                    
                    <div class="form-bug-project">
                        <label for="project">Project</label>
                        <select name="project">
                            <option value="">Select</option>
                            <%
                                rs = stmt.executeQuery("Select * from project");
                                while(rs.next()){
                                    out.print("<option value='"+rs.getString("id")+"'>"+rs.getString("name")+"</option>");
                                } 
                            %>
                        </select>
                    </div>
                    <div class="form-bug-Priority">
                        <label for="priority">Priority</label>
                        <select name="priority">
                            <option value="">Select</option>
                            <option value="1">High</option>
                            <option value="2">Medium</option>
                            <option value="3">Low</option>
                        </select>
                    </div>
                     
                    <div class="form-bug-Detail">
                       <label for="Detail">Detail</label>
                       <textarea id="Detail" name="Detail"></textarea>
                    </div>
                    <div class="form-bug-comment">
                        <label for="comment">Comment</label>
                        <textarea name="comment"></textarea>
                    </div>
                    <div class="form-bug-assigned-assign">
                        <label for="Assign">Assign</label>
                        <select name="assign">
                            <option value="">select</option>
                            <%
                                rs = stmt.executeQuery("Select * from user INNER JOIN role ON role.id=user.roleid where role.name!='admin'");
                                while(rs.next()){
                                    out.print("<option value='"+rs.getString("user.id")+"'>"+rs.getString("user.name")+"</option>");
                                } 
                            %>
                        </select> 
                    </div>
                    <!--<div class="form-bug-file">
                        <label for="file">File</label>
                        <input type="file" name="file">
                    </div>-->
                    <div class="form-bug-submit">
                        <input type="submit" value="Submit">
                    </div>
                </form>
                </div>
        </body>
</html>
<%@ include file="module/footer.jsp"%>
