<%-- 
    Document   : feedback
    Created on : Sep 23, 2017, 2:05:24 PM
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
        String clientid=request.getParameter("sel");
         String devid=request.getParameter("sel2");
        String ra=request.getParameter("txt_rating");
        String str="insert into tbl_rating(client_id,developer_id,rating)values('"+clientid+"','"+devid+"','"+ra+"',)";
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
        <title>Client Feedback</title>
        
    </head>
    <body>
        <form>
        <table>
            
            
            <tr><h1><u>Client Feedback Form</u></h1></tr>
         <input type="hidden" name="hid" value="<%=id%>">
       
        <tr>
		<td>Client_Name:</td><td>
		<select name="sel" id="sel" ><option value="se1"  >--Select--</option>
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
		<select name="sel2" id="sel2" ><option value="sel2"  >--Select--</option>
		<%
                    
                    String sel2="select * from tbl_developer";
                    ResultSet rs2=obj.select(sel2);
                    while(rs2.next())
                    {%>
                        <option value="<%=rs.getString("developer_id")%>" <%if (rs.getString("developer_id").equals(cid)){%>selected="true"  <%} %>>
                            <%=rs.getString("dev_name")%></option>
                    <%}

                      %>
		</select></td>
	</tr>
        <tr><td>Rating:</td><td><input type="textbox" id="rating" name="txt_rating" value="<%=cid%>"></td>
        </tr>
        
        <tr>
	<td><input type="submit" name="btn_submit" value="SUBMIT"></td>
	<td><input type="reset" name="btn_reset" value="CANCEL"></td>
	</tr>
            
        </table>
        </form>
    </body>