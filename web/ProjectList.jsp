<%-- 
    Document   : ProjectList
    Created on : Oct 9, 2017, 12:20:55 PM
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
                if(request.getParameter("ac")!=null)
                     {
                            //String de=request.getParameter("ac");
                           // String acQry="update tbl_clientproject set project_status=2 where project_id="+de;
                           // boolean b = obj.insert(acQry);
                            //if(b==true)
                           // {
                         
                            out.print("Message sent successfully to the client");
                         
                            //}
                     }
            
                
                %>
        
                 <div class="col-md-3"></div>
        
        <div class="col-md-9"  style="margin-top: -20px">
        <form class="form-group">
            <table align="center" class="table table-hover">
      
              
                          
                <tr>
                    
                        <%
                        String str="select * from tbl_clientproject c inner join tbl_technology t on c.tech_id=t.tech_id";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <th>
                                 <h3><%=rs1.getString("project_name")%></h3>
                             </th>
                         </tr>
                         <tr>
                              <th>Technology</th> <th>Project Budget</th>
                         </tr>
                         <tr>
                              <td>
                                 <%=rs1.getString("tech_name")%>
                             </td>
                              <td>
                                 <%=rs1.getString("project_budget")%>
                             </td>
                      
                            
                     
                         
                                                                           
                           <td>
                               <a href="ViewDetails.jsp?view=<%=rs1.getString("project_id")%>" class="btn btn-info">View</a>
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
