<%-- 
    Document   : Developer_registration
    Created on : Sep 16, 2017, 2:35:55 PM
    Author     : student25
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    if(request.getParameter("btn_submit")!=null)
    {
        
        String na=request.getParameter("txt_devname");
        String ad=request.getParameter("txt_devaddress");
        String em=request.getParameter("txt_devemail");
        String ge=request.getParameter("gender");
        String se=request.getParameter("sel");
        String ex=request.getParameter("txt_devexperience");
        String str="insert into tbl_developer(dev_name,dev_address,dev_email,dev_gender,dev_qualification,dev_experience)values('"+na+"','"+ad+"','"+em+"','"+ge+"','"+se+"','"+ex+"')";
        //out.print(str);
            boolean b=obj.insert(str);
            if(b==true)
            {
                session.setAttribute("email", em);
                    response.sendRedirect("Proof.jsp");   
            }
                        
                        //out.print("success");
             //   else
               //             out.print(str);

         
         
                
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developer Registration</title>
        
    </head>
    <body>
        <form>
        <table>
            <tr><h1><u>Registration Form</u></h1></tr>
        <tr><td>Name:</td><td><input type="textbox" id="devname" name="txt_devname"></td>
        </tr>
        <tr>
            <td>Address:</td><td><textarea id="devaddress" name="txt_devaddress"></textarea></td>
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
        
        <tr>
	<td><input type="submit" name="btn_submit" value="NEXT"></td>
	<td><input type="reset" name="btn_reset" value="RESET"></td>
	</tr>
            
        </table>
        </form>
    </body>
</html>
