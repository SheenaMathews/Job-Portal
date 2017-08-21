<%-- 
    Document   : Login
    Created on : Aug 21, 2017, 10:32:17 AM
    Author     : student25
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String status="";
     if(request.getParameter("submit")!=null)
    {
        
        String uname=request.getParameter("txt_uname");
        String pwd=request.getParameter("txt_pwd");
            String str="select user_name,password from tbl_login where user_name='"+uname+"' and password='"+pwd+"'";
            ResultSet rs=obj.select(str);
           if(rs.next())
           {
               response.sendRedirect("Home.jsp");
           }
           else
               status="Inavalid user";
    }
       
    
     
     %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <form>
        <table align="center">
   
        <tr>
        <td>
        User_Name:</td><td><input type="textbox" name="txt_uname" id="txt_uname"></td></tr>
        <tr>
    <td>
        Password:</td><td><input type="password" name="txt_pwd" id="txt_pwd"></td></tr>

<tr><td><input type="submit" name="submit" value="Submit">
        <input type="Reset" name="reset" value="Cancel"></td></tr>
<td>
        <span name="span1"><%=status%></span></td>
</table>
</form>
          </body>
</html>
