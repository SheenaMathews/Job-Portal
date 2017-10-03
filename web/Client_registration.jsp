<%-- 
    Document   : Client_registration
    Created on : Sep 16, 2017, 2:36:32 PM
    Author     : student26
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
String id="",did="";
    if(request.getParameter("b1")!=null)
    {
    
String name=request.getParameter("txt_clientname");
String address1=request.getParameter("txt_clientaddress");
String email=request.getParameter("txt_clientemail");
String contactno=request.getParameter("txt_clientcontactno");
String aadharno=request.getParameter("txt_clientaadharno");
String gender=request.getParameter("gender");
String uname=request.getParameter("txt_clientuname");
String pwd=request.getParameter("txt_clientpassword");
String PlaceID=request.getParameter("ddlPlace");
String str="insert into tbl_client(client_name,client_address,client_email,client_contactno,client_aadhrno,client_gender,client_username,client_password,place_id)values('"+name+"','"+address1+"','"+email+"','"+contactno+"','"+aadharno+"','"+gender+"','"+uname+"','"+pwd+"','"+PlaceID+"')";

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
                    <h1><u>ClientRegistration</u></h1>
                </td>
                </tr>
                
                <tr>
                    <td>Name:</td>
                    <td><input type="textbox" id="clientname" name="txt_clientname"></td>
                </tr>
                <tr><td>Address:</td><td><textarea id="clientaddress" name="txt_clientaddress"></textarea></td></tr>
                 <tr>
		
		 <h1 align="center"><font color="red"></font></h1>
		
                     <input type="hidden" name="hid" value="<%=id%>">
               <tr>
		<td>District:</td>
		<td>
                    <select name="ddlPlace" id="ddlPlace">
                        <option value="se">--Select--</option>
                        <%
                            String se="select* from tbl_place";
                           ResultSet rs=obj.select(se);
                           while(rs.next())
                           { %>
                           <option value="<%=rs.getString("place_id")%>"<%if(rs.getString("place_id").equals(did)){%>selected="true"<%}%>>
                           <%=rs.getString("place_name")%></option>
                           <%}
                            %>
			
		</select>
                </td>
		
	</tr>
                <tr><td>Email:</td><td><input type="email" id="clientemail" name="txt_clientemail"></td></tr>
                <tr><td>Contact_no:</td><td><input type="textbox" id="clientcontactno" name="txt_clientcontactno"></td></tr>
                <tr><td>Aadhar_no:</td><td><input type="textbox" id="clientaadhrno" name="txt_clientaadharno"></td></tr>
                <tr>
		<td>Gender:</td>
		<td><input type="radio" name="gender" value="male" >Male</input>
		<input type="radio" name="gender" value="female">Female</input></td>
		</tr>
                <tr><td>UserName:</td><td><input type="textbox" id="clientuname" name="txt_clientuname"></td>
        </tr>
        
        </tr>
        <tr><td>Password:</td><td><input type="password" id="clientpassword" name="txt_clientpassword"></td>
        </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="b1" value="submit">
                    <input type="Reset" name="b2"  value="reset">
                    </td>
                
                
		
		</tr>
        </table>
        </form>
        
    </body>
</html>
