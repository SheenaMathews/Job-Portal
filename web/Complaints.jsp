<%-- 
    Document   : Complaints
    Created on : Sep 23, 2017, 3:06:27 PM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String cid="",id="",did="";
    if(request.getParameter("btn_submit")!=null)
    {
        
        String co=request.getParameter("comments");
        
       
        String str="insert into tbl_complaints(client_id,developer_id,comments)values('"+cid+"','"+did+"','"+co+")";
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
        <title>Complaints</title>
    </head>
   
    <body>
        <form>
        <table>
            <tr><h1><u>Developer_Proof</u></h1></tr>
       
            <tr>
		<td>Client_Name:</td><td>
		<select name="sel" id="sel" ><option value="se"  >--Select--</option>
			<%
                    
                    String sel="select * from tbl_client";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    {%>
                    <option value="<%=rs.getString("client_id")%>" <%if (rs.getString("client_id").equals(cid)){%>selected="true"  <%} %>>
                            <%=rs.getString("client_name")%></option>
                    <%}
                    %>
		</select></td>
                
                
	</tr>
       
        <tr>
		<td>Developer_Name:</td><td>
		<select name="sel2" id="sel2" ><option value="se2"  >--Select--</option>
		<%
                    
                    String sel2="select * from tbl_developer";
                    ResultSet rs2=obj.select(sel2);
                    while(rs2.next())
                    {%>
                    <option value="<%=rs2.getString("developer_id")%>" <%if (rs2.getString("developer_id").equals(did)){%>selected="true"  <%} %>>
                            <%=rs2.getString("dev_name")%></option>
                    <%}
                    %>
		</select></td>
	</tr>
        <tr><td>Comments:</td><td><input type="textbox" id="rating" name="txt_comments"></td>
        </tr>
         <tr>
	<td><input type="submit" name="btn_submit" value="SUBMIT"></td>
	<td><input type="reset" name="btn_reset" value="CANCEL"></td>
	</tr>
        </table>
        </form>
    </body>
</html>
