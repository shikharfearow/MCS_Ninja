<%-- 
    Document   : login
    Created on : 15-May-2022, 10:42:51 pm
    Author     : 91942
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

<%if(session.getAttribute("log_error")!=null){%>
<script>
            alert("wrong credentials");
</script>
    <%}
%>


                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Login Page</title>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
                <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/login.css"/>
                <script src="script/login_validation.js"></script>
        </head>
        <body >
                <%@include  file="/module/nav_bar.jsp" %>
                <%@include  file="/dbconnect.jsp" %>
                <div class="background">
                        <div class="login-form">
                                <div class="login_graphic">
                                </div>
                                <div class="form-login">
                                    <form action="backend/db_login.jsp" method="GET">
                                                <div class="form-login-intro">
                                                        <p class="form-login-title">
                                                                LOG IN
                                                        </p>
                                                        <p class="form-login-para">
                                                            Ninja is your one stop solution for every project management need. Log in now and start your journey.
                                                        </p>
                                                </div>
                                                <div class="form-login-email">
                                                       <label>email</label>
                                                       <input type="email" name="email" id="email"> 
                                                </div>
                                                <div class="form-login-password">
                                                        <label>password</label>
                                                        <input type="password" name="password" id="password">
                                                </div>
                                                <div class="form-login-submit">
                                                    <input type="submit" value="Submit" id="submit_btn">
                                                </div>
                                        </form>
                                    
                                </div>
                        </div>
                </div>
                
        </body>
</html>
<%@ include file="module/footer.jsp"%>
