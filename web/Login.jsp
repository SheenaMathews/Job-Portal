<%-- 
    Document   : login
    Created on : Aug 21, 2017, 10:32:27 AM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String status="";
 if(request.getParameter("submit")!=null)
    {
    
String name=request.getParameter("txt_uname");
String pswd=request.getParameter("txt_pswd");
String str="select * from  tbl_login where login_username='"+name+"' and login_password='"+pswd+"'";
    ResultSet rs=obj.select(str);
    
    String str1="select * from  tbl_client where client_username='"+name+"' and client_password='"+pswd+"'";
    ResultSet rs1=obj.select(str1);
            
    String str2="select * from  tbl_developer where dev_username='"+name+"' and dev_password='"+pswd+"' and dev_status='1'";
    ResultSet rs2=obj.select(str2);
    if(rs.next())
    {
        response.sendRedirect("../Admin/HomePage.jsp");
    }
   else if(rs1.next())
    {
        session.setAttribute("lgid", rs1.getString("client_id"));
        session.setAttribute("lgname", rs1.getString("client_name"));
        response.sendRedirect("../Client/HomePage.jsp");
    }
   else if(rs2.next())
    {
          session.setAttribute("lgid", rs2.getString("dev_id"));
        session.setAttribute("lgname", rs2.getString("dev_name"));
        response.sendRedirect("../Developer/HomePage.jsp");
    }
    else
       status="invalid user";
    
        
    
      
      
       }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
<table align="center">
<tr>
<td>
<th>UserName:</th> </td>
<td><input type="textbox" name="txt_uname" id="txt_uname"></input></td></tr>

<tr><td>
        <th>Password:</th>
        <td><input type="password" name="txt_pswd" id="txt_pswd"></input></td><td><span name="span1"><%=status%></span></td>
<tr><td><input type="submit"  name="submit" value="submit">
<input type="reset" value="reset"></td></tr>
</table>
        </form>
    </body>
</html>
