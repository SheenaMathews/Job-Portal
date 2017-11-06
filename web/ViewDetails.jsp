<%-- 
    Document   : ViewList
    Created on : Oct 26, 2017, 3:53:17 PM
    Author     : student26
--%>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resi Bootstrap Template</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/responsive-slider.css" rel="stylesheet">
  <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link href="css/style.css" rel="stylesheet">
  <!-- =======================================================
    Theme Name: Resi
    Theme URL: https://bootstrapmade.com/resi-free-bootstrap-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
  <header>
    <div class="container">
      <div class="row">
        <nav class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <div class="navbar-brand">
                <a href="index.html"><h1>Freelancer</h1></a>
              </div>
            </div>
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                   <li role="presentation"><a href="home.jsp">Home</a></li>
                <li role="presentation" ><a href="MyProfile.jsp">MyProfile</a></li>
                
                <li role="presentation"><a href="Devchangepwd.jsp">ChangePassword</a></li>
                 
                  
                  <li role="presentation"  class="active"><a href="ProjectList.jsp">Project Lists</a></li>
                  <li role="presentation"><a href="AcceptedProjects.jsp">Accepted Project Lists</a></li>
                  
                  <li role="presentation"><a href="../Guest/index.html">Logout</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </header>
    <div class="container">
        <div class="row">
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  <script src="js/responsive-slider.js"></script>
  <script src="js/wow.min.js"></script>
  <script>
    wow = new WOW({}).init();
  </script>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String view=request.getParameter("view");
        %>
        
         <div class="col-md-3"></div>
        
        <div class="col-md-9"  style="margin-top: -20px">
        <form class="form-group">
            <table align="center" class="table table-hover">
      
              
                    
                        <%
                        String str="select * from tbl_client c inner join tbl_clientproject p on c.client_id=p.client_id inner join tbl_technology t on p.tech_id=t.tech_id where p.project_id="+view;
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                <tr>
                    <td><th>
                        <%=rs1.getString("project_name")%> </th>
                    </td>
                    </tr>
               
                         <tr>
                             <td>Description:</td>
                             
                             <td>
                                 <%=rs1.getString("project_description")%>
                             </td>
                         </tr>
                         <tr>
                             <td>Technology:</td>
                             
                             <td>
                                 <%=rs1.getString("tech_name")%>
                             </td>
                         </tr>
                        <tr>
                             <td>Budget:</td>
                             
                             <td>
                                 <%=rs1.getString("project_budget")%>
                             </td>
                         </tr>
                          
                         <tr>
                             <td>Duration:</td>
                             
                             <td>
                                 <%=rs1.getString("project_duration")%>
                             </td>
                         </tr>
                         <td>
                             &nbsp;
                         </td>
                         <td>
                             <a href="MarkIntrest.jsp?pid=<%=rs1.getString("project_id")%>&cid=<%=rs1.getString("client_id")%>" class="btn btn-info">Mark_Intrest</a>
                         </td>
                         
                        
                </tr>
                        
                        <%
                         }
                        %>
                        
                   <td>
                   </td>
               
            </table>
        </form>


    
    </body>
</html>

