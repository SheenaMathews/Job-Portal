<%-- 
    Document   : Proof
    Created on : Sep 23, 2017, 2:51:28 PM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String cid="",id="",did="",user="";
    if(request.getParameter("btn_submit")!=null)
    {
        String email=session.getAttribute("email").toString();
        String str="select * from tbl_developer where dev_email='"+email+"'";
        ResultSet rs=obj.select(str);
        if(rs.next())
        {
          user=rs.getString("developer_id");      
        }
        
        
        
        
        String p1=request.getParameter("proof1");
        String p2=request.getParameter("proof2");
        String devid=request.getParameter("sel");
       
       str="insert into tbl_proof(developer_id,proof1,proof2)values('"+user+"','"+p1+"','"+p2+"')";
       //out.print(str);
            boolean b=obj.insert(str);
            if(b==true)
                        out.print("success");
            else
                        out.print(str);
            
         
         
                
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developer Proof</title>
    </head>
   
    <body>
        <form>
        <table>
            <tr><h1><u>Developer_Proof</u></h1></tr>
       
           <tr>
		<td>Developer_Name:</td><td>
		<select name="sel" id="sel" ><option value="sel"  >--Select--</option>
			 <%
                    
                    String sel="select * from tbl_developer";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    {%>
                        <option value="<%=rs.getString("developer_id")%>"><%=rs.getString("dev_name")%></option>
                    <%}

                      %>
                    %>
		</select></td>
                
                
	</tr>
         <tr><td>Proof1:</td><td><input type="file" id="proof1" name="proof1"></td>
        </tr>
        <tr><td>Proof2:</td><td><input type="file" id="proof2" name="proof2"></td>
        </tr>
       
        <tr>
	<td><input type="submit" name="btn_submit" value="SUBMIT"></td>
	<td><input type="reset" name="btn_reset" value="CANCEL"></td>
	</tr>
            
        </table>
        </form>
    </body>
</html>
