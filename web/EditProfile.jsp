<%-- 
    Document   : EditProfile
    Created on : Oct 9, 2017, 2:28:44 PM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>

<%
    String client_id=session.getAttribute("lgid").toString();

    if(request.getParameter("btn_submit")!=null)
    {
    
String name=request.getParameter("txt_clientname");

String email=request.getParameter("txt_clientemail");
String contactno=request.getParameter("txt_clientcontactno");
String aadharno=request.getParameter("txt_clientaadharno");
String str="update tbl_client set client_name='"+name+"',client_email='"+email+"',client_contactno='"+contactno+"',client_aadhrno='"+aadharno+"' where client_id='"+client_id+"'";

      boolean b=obj.insert(str);
      if(b==true)
            out.print("sucess");
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
        
        <form>
        <table align="center">
            <tr>
                <td colspan="2">
                    <h1><u>EditProfile</u></h1>
                </td>
                
                </tr>
                <tr>
                    
                        <%
                        
                        String str="select client_name,client_address,client_email,client_contactno,client_aadhrno from tbl_client where client_id='"+client_id+"'";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                <tr>
                    <td>Name:</td>
                    <td><input type="textbox" id="clientname" name="txt_clientname" value=" <%=rs1.getString("client_name")%>"></td>
                </tr>
                
                <tr><td>Email:</td><td><input type="email" id="clientemail" name="txt_clientemail" value="<%=rs1.getString("client_email")%>"></td></tr>
                <tr><td>Contact_no:</td><td><input type="textbox" id="clientcontactno" name="txt_clientcontactno" value="<%=rs1.getString("client_contactno")%>"></td></tr>
                <tr><td>Aadhar_no:</td><td><input type="textbox" id="clientaadhrno" name="txt_clientaadharno" value="<%=rs1.getString("client_aadhrno")%>"></td></tr>
                <%
                  }
                 %>
                
                <tr>
	<td colspan="2" align="center">
            <input type="submit" name="btn_submit" value="SUBMIT">         
	<input type="reset" name="btn_reset" value="RESET"></td>
	</tr>
       
        </table>
        </form>
        </html>

