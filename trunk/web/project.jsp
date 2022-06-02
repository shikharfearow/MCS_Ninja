<%-- 
    Document   : project-manager
    Created on : 26-May-2022, 2:36:24 PM
    Author     : IAmGroooooT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Project Page</title>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/common.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/login.css"/>
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <div class="container">
                    <form action="backend/db_add_project.jsp" method="post">
                    <div class="form-project-name">
                        <label for="name">Name</label>
                        <input type="text" name="name"> 
                    </div>
                    <div class="form-project-Start-date">
                       <label for="Start-date">Start Date</label>
                       <input type="Date" name="Start-date"> 
                    </div>
                    <div class="form-project-End-date">
                       <label for="End-date">End Date</label>
                       <input type="Date" name="End-date"> 
                    </div>
                    <div class="form-project-Priority">
                        <label for="priority">Priority</label>
                        <select name="priority">
                            <option value="">Select</option>
                            <option value="1">High</option>
                            <option value="2">Medium</option>
                            <option value="3">Low</option>
                        </select>
                    </div>
                    <div class="form-project-phase">
                       <label for="phase">Phase</label>                                              
                       <select name="phase">
                           <option value="">Select</option>
                           <option value="SIT">SIT</option>
                           <option value="UAT">UAT</option>
                           <option value="PRE PROD">PRE PROD</option>
                           <option value="PROD">PROD</option>
                           <option value="Live">Live</option>
                       </select>
                    </div>
                    <div class="form-project-file">
                        <label for="file">File</label>
                        <input type="file" name="file">
                    </div>
                    <div class="form-project-submit">
                        <input type="submit" value="Submit">
                    </div>
                </form>
                </div>
        </body>
</html>
<%@ include file="module/footer.jsp"%>