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
        <title>Project/Bug Feed</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/login_res/ninja.jpg">
        <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/style/general.css"/>
  
    </head>
    <%@include  file="/module/nav_bar.jsp" %>
    <%@include file="/dbconnect.jsp" %>
    <body>
        <div class="background2">        
            <div class="salute">
                <h3>Welcome, <%=session.getAttribute("name")%></h3>
            </div>
            <% if(session.getAttribute("role").equals("2")){ %>
                <div class="width-45 pdlr25">
                    <div class="feed">
                        <div class="project_feed">
                            <div class="feed_title">  
                                <a class="btn_add" href="project.jsp">ADD</a>
                                <h3 class="headding">PROJECTS</h3>
                            </div>
                            <div class="scy80vh">
                            <%
                                try {
                                    rs = stmt.executeQuery("Select * from project");
                                    while(rs.next()){
                            %>
                            <div class="project_item panel" onclick="showProjectModel(<%=rs.getString("id")%>,'<%=rs.getString("name")%>','<%=rs.getString("start_date")%>','<%=rs.getString("priority")%>','<%=rs.getString("end_date")%>','<%=rs.getString("details")%>')">
                                    <h3>PROJECT ID:<%=rs.getString("id")%></h3>
                                    <h3><%=rs.getString("name")%></h3>
                                    <p>ETA:<%=rs.getString("end_date")%></p>
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
                            <%}}catch(Exception e){ %>
                                <div>Something went wrong for project feed.</div>
                            <%}%>
                        </div>
                    </div>
                </div>
                            </div>
        <div class="width-45 pdlr25">
            <%}else{%>
        <div class="width-95 pdlr25">
            <%}%>
            <div class="bug_feed">
                <div class="feed_title">
                    <a class="btn_add" href="bug.jsp">ADD</a>
                    <h3 class="headding">BUGS</h3>
                </div>
                <div class='scy80vh'>
                    <%
                        try {
                            rs = stmt.executeQuery("Select * from bug,user,project where project.id=bug.project_id and bug.assigned_to = user.id and bug.assigned_to="+session.getAttribute("id"));
                            while(rs.next()){
                    %>
                    
                    <div class="bug_item panel" onclick="showBugModel(<%=rs.getString("id")%>,'<%=rs.getString("name")%>','<%=rs.getString("register_date")%>','<%=rs.getString("priority")%>','<%=rs.getString("solve_date")%>','<%=rs.getString("project.name")%>','<%=rs.getString("user.id")%>','<%=rs.getString("user.name")%>','<%=rs.getString("detail")%>','<%=rs.getString("comment")%>'),'<%=rs.getString("status")%>'" >
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
                        <%} }catch(Exception e){}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="model" id="projectModel"style="display: none" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-modal="true">
            <div class="modal-dialog">
               <div class="headder">
                   <span aria-hidden="true" onclick="hideModel()">×</span>
                </div>
                <div class="model-body">
                    <div><label>Project Id : </label><span id="pid">2</span></div>
                    <div><label>Name : </label><span id="pname">Ninja</span></div>
                    <div><label>Start Date : </label><span id="psdate">4/jan/22</span></div>
                    <div><label>ETA : </label><span id="pedate">10/jan/22</span></div>
                    <div><label>Priority : </label><span id="ppriority">High</span></div>
                    <div class="textArea"><label>Detail : </label><br><textarea id="pdetail" disabled="disabled"></textarea></div>
                </div>
            </div>        
        </div>
        <div class="model" id="bugModel"style="display: none" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-modal="true">
            <div class="modal-dialog">
               <div class="headder">
                   <span aria-hidden="true" onclick="hideModel()">×</span>
                </div>
                <div class="model-body">
                    <div><label>Bug Id : </label><span id="bid">2</span></div>
                    <div><label>Name : </label><span id="bname">Ninja</span></div>
                    <div><label>Project : </label><span id="bpname">Ninja</span></div>
                    <div><label>Priority : </label><span id="bpriority">High</span></div>
                    <div><label>Start Date : </label><span id="bsdate">4/jan/22</span></div>
                    <div><label>ETA : </label><span id="bedate">10/jan/22</span></div>
                    <div><label>Assigned to : </label><span id="bassignedto">10/jan/22</span></div>
                    <div><label>Status : </label><span id="bstatus">New</span></div>
                    <div class="textArea"><label>Detail : </label><br><textarea id="bdetail" disabled="disabled"></textarea></div>
                    <div class="textArea"><label>Comment : </label><br><textarea id="bcomment" disabled="disabled"></textarea></div>
                </div>
            </div>        
        </div>
    </body>
    <script>
        var showBugModel=function(id,name,startDate,priority,ETA,project,assignedToid,assignedTo,details,comment,status){
            document.getElementById("bugModel").style.display = 'block';
            document.getElementById("bid").innerHTML=id;
            document.getElementById("bname").innerHTML=name;
            document.getElementById("bpname").innerHTML=project;
            document.getElementById("bsdate").innerHTML=startDate;
            document.getElementById("bedate").innerHTML=ETA;
            document.getElementById("bassignedto").innerHTML=assignedTo;
            document.getElementById("bpriority").innerHTML=getPriority(priority);
            document.getElementById("bdetail").value=details;
            document.getElementById("bcomment").value=comment;
            document.getElementById("bstatus").innerHTML=status;
        };
        var showProjectModel=function(id,name,startDate,priority,ETA,details){
            document.getElementById("projectModel").style.display = 'block';
            document.getElementById("pid").innerHTML=id;
            document.getElementById("pname").innerHTML=name;
            document.getElementById("psdate").innerHTML=startDate;
            document.getElementById("pedate").innerHTML=ETA;
            document.getElementById("ppriority").innerHTML=getPriority(priority);
            document.getElementById("pdetail").value=details;
            
            
        };
        var hideModel=function(){
            document.getElementById("projectModel").style.display = 'none';
            document.getElementById("bugModel").style.display = 'none';
        };
        var getPriority= function(priority){
            if(priority==="1"){
                return "High";
            }else if(priority==="2"){
                return "Medium";
            }else{
                return "Low";
            }
        }
    </script>
</html>
