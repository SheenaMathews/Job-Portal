<%-- 
    Document   : MarkIntrest
    Created on : Oct 28, 2017, 10:09:24 AM
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
<%
   String clientid=request.getParameter("cid");
     String projectid=request.getParameter("pid");
   // String projectid=session.getAttribute("lgid").toString();
    
   
    if(request.getParameter("btn_submit")!=null)
    {
     String devid=session.getAttribute("lgid").toString();
     clientid=request.getParameter("cid");
     projectid=request.getParameter("pid");
//String date=request.getParameter("dt_date");
String dur=request.getParameter("txt_duration");
String amt=request.getParameter("txt_famount");
String desc=request.getParameter("txt_description");

String str="insert into tbl_makintrest(dev_id,client_id,project_id,intrest_date,duration,amount,description) values('"+devid+"','"+clientid+"','"+projectid+"',curdate(),'"+dur+"','"+amt+"','"+desc+"')";

      boolean b=obj.insert(str);
      if(b==true)
            out.print("Message sent successfully...Please wait");
      else
          out.print(str);
    }

%>






<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="col-md-3"></div>
        
        <div class="col-md-9"  style="margin-top: -20px">
        <form class="form-group">
            <table align="center" class="table table-hover">
      
              
              <input type="hidden" name="cid" value="<%=clientid%>">
               <input type="hidden" name="pid" value="<%=projectid%>">
             
        
            <tr>
                <td colspan="2">
                    <h1><u>Enter Details</u></h1>
                </td>
               
                <tr>
                    <td>Description if any:</td>
                    <td><input type="textbox" id="desccription" name="txt_description" required=""></td>
                </tr>
                <tr>
                    <td>Expected Duration in months:</td>
                    <td><input type="textbox" id="duration" name="txt_duration" required=""></td>
                </tr>
                <tr>
                    <td>Final amount:</td>
                    <td><input type="textbox" id="famount" name="txt_famount" required=""></td>
                </tr>
                <tr>
	       
         <td colspan="5" align="right">
                        <a href="ProjectList.jsp"> <input type="submit" name="btn_submit" class="btn btn-success" value="Submit"></a>
                   </td>
                </tr>
                <tr>
    </body>
</html>
