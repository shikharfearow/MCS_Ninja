<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/nav.css">
    </head>
    <body>
        <%@include  file="check_login.jsp" %> 
        <div class="navbar">
            <p class="navbar-title">ninja</p>
            <img src="${pageContext.request.contextPath}/login_res/ninja.jpg" alt="logo" class="logo">
            <%if(!request.getRequestURI().equals(request.getContextPath()+"/login.jsp")){%>
                    <a class="btn_add" style="margin-top:15px;margin-right:125px;box-shadow: 0px;" href="logout.jsp">LOGOUT</a>
            <%}%>
        </div>
    </body>
</html>
