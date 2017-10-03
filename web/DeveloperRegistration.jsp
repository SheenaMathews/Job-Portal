<%-- 
    Document   : Developer_registration
    Created on : Sep 16, 2017, 2:35:55 PM
    Author     : student25
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String id="",did="";
    if(request.getParameter("btn_submit")!=null)
    {
        
        String na=request.getParameter("txt_devname");
        String ad=request.getParameter("txt_devaddress");
        String p=request.getParameter("txt_devplace");
        String em=request.getParameter("txt_devemail");
        String ge=request.getParameter("gender");
        String se=request.getParameter("sel");
        String ex=request.getParameter("txt_devexperience");
         String placeID=request.getParameter("ddlPlace");
         
          String userName=request.getParameter("txt_devuname");
           String pwd=request.getParameter("txt_devpassword");
           String addhr=request.getParameter("txt_devaadharno");
           String pincode=request.getParameter("txt_devpin");
         
        String str="insert into tbl_developer(dev_name,dev_address,dev_localplace,dev_email,dev_gender,dev_qualification,dev_experience,place_id,dev_status,dev_username,dev_password,dev_aadhrno,dev_pincode)values('"+na+"','"+ad+"','"+p+"','"+em+"','"+ge+"','"+se+"','"+ex+"','"+placeID+"','0','"+userName+"','"+pwd+"','"+addhr+"','"+pincode+"')";
        out.print(str);
            boolean b=obj.insert(str);
            if(b==true)
            {
                //session.setAttribute("email", em);
                   // response.sendRedirect("Proof.jsp");   
            }
                        
                        //out.print("success");
             //   else
               //             out.print(str);

         
         
                
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DeveloperRegistration</title>
        
    </head>
    <body>
        <form>
        <table align="center">
            <tr><h1><u>Registration Form</u></h1></tr>
        
        <tr>
            <td>Name:</td>
            <td><input type="textbox" id="devname" name="txt_devname"></td>
        </tr>
        
        
        <tr>
            <td>Address:</td><td><textarea id="devaddress" name="txt_devaddress"></textarea></td>
           
        </tr>
        
        <tr>
		
		 <h1 align="center"><font color="red"></font></h1>
		
                     <input type="hidden" name="hid" value="<%=id%>">
               <tr>
		<td>PlaceName</td>
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
		</select></td>
	</tr>
        
        <tr><td>Place:</td><td><input type="textbox" id="devplace" name="txt_devplace"></td>
        </tr>
        
        <tr><td>Pincode:</td><td><input type="textbox" id="devpin" name="txt_devpin"></td>
        </tr>
        
        <tr><td>Aadhar No:</td><td><input type="textbox" id="devaadarno" name="txt_devaadharno"></td>
        </tr>
        <tr>
            <td>Email:</td><td><input type="email" id="devemail" name="txt_devemail"></td>
        </tr>
        <tr>
            <td>Gender:</td><td><input type="radio" name="gender" value="male">Male
                <input type="radio" name="gender" value="female">Female</td>
        </tr>
        <tr>
		<td>Qualification:</td><td>
		<select name="sel" id="sel" ><option value="se"  >--Select--</option>
			<option value="MBA">MBA</option>
			<option value="MCA">MCA</option>
			<option value="MSC">MSC</option>
		</select></td>
	</tr>
        <tr><td>Experience:</td><td><input type="textbox" id="devexperience" name="txt_devexperience"></td>
        </tr>
        
        </tr>
        <tr><td>User Name:</td><td><input type="textbox" id="devuname" name="txt_devuname"></td>
        </tr>
        
        </tr>
        <tr><td>Password:</td><td><input type="password" id="devpassword" name="txt_devpassword"></td>
        </tr>
        <tr>
	<td colspan="2" align="center">
            <input type="submit" name="btn_submit" value="NEXT">
	<input type="reset" name="btn_reset" value="RESET"></td>
	</tr>
            
        </table>
        </form>
    </body>
</html>
