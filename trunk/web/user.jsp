<%-- 
    Document   : admin
    Created on : 25-May-2022, 7:48:10 PM
    Author     : IAmGroooooT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Login Page</title>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/login.css"/>
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <form>
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
                        <label name="role">Role</label>
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
                    <div class="form-user-phone">
                        <label for="phone">Phone</label>                                        
                        <input type="phone" name="phone">
                    </div>
                    <div class="form-user-submit">
                        <input type="submit" value="Submit">
                    </div>
            </form>
        </body>
</html>
<%@ include file="module/footer.jsp"%>


