<%-- 
    Document   : admin
    Created on : 25-May-2022, 7:48:10 PM
    Author     : IAmGroooooT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>User Page</title>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/common.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/login.css"/>
                <script>
                        window.onload = function(){
                            var today = new Date();
                            var month = (today.getMonth()+1).toLocaleString('en-US', {
                                                minimumIntegerDigits: 2,
                                                useGrouping: false
                                                });
                            var date = today.getFullYear()+'-'+(month)+'-'+today.getDate();

                            document.getElementById("jod").value = date;
                            document.getElementById("jod").max = date;
                          
                        };
                </script>
        
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <div class="container">
                    <form action="backend/db_user.jsp" method="post">
                    <div class="form-user-name">
                        <label for="name">Name</label>
                        <input type="text" name="name"> 
                    </div>
                    <div class="form-user-email">
                        <label for="email">Email</label>
                        <input type="email" name="email"> 
                    </div>
                    <div class="form-user-password">
                        <label for="password">Password</label>
                        <input type="password" name="password">
                    </div>
                    <div class="form-user-role">
                        <label for="role">Role</label>
                        <select name="role">
                            <option value="">select</option>
                            <%
                                rs = stmt.executeQuery("Select * from role");
                                while(rs.next()){
                                    out.print("<option value='"+rs.getString("id")+"'>"+rs.getString("name")+"</option>");
                                } 
                            %>
                        </select>
                    </div>
                     <div class="form-user-name">
                        <label for="emp_des">Employee Designation</label>
                        <input type="text" name="emp_des"> 
                    </div>
                    <div class="form-user-phone">
                        <label for="phone">Phone</label>                                        
                        <input type="tel" name="phone">
                    </div>
                        <div class="form-user-phone">
                     <label for="start">Joining date:</label>

                        <input type="date" id="jod" name="jod"
                               value=""
                        min="2018-01-01">
                        </div>
                    <div class="form-user-submit">
                        <input type="submit" value="Submit">
                    </div>
            </form>
                </div>
        </body>
</html>
<%@ include file="module/footer.jsp"%>


