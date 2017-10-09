<%-- 
    Document   : add_project
    Created on : Sep 23, 2017, 2:05:48 PM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>

<%
    /* String cat="",id="";
     if(request.getParameter("dl")!=null)
                            {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_clientProject where project_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
    }
      if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_clientProject where project_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
               id=rs.getString("project_id");
              cat=rs.getString("project_name");
                           
              
           }
       }

       
       
       
    if(request.getParameter("b1")!=null)
    {
    
String pname=request.getParameter("txt_pname");
if(!request.getParameter("hid").equals(""))
{
String up=request.getParameter("hid");
String update="update tbl_clientproject set project_name='"+pname+"' where project_id="+up;
boolean b=obj.insert(update);
}
else
{
   
String str="insert into tbl_clientproject(project_name)value('"+pname+"')";

      boolean b=obj.insert(str);
      if(b==true)
            out.print("sucess");
      else
          out.print(str);
    }

}*/
%>


         <%

             String client_id=session.getAttribute("lgid").toString();
   if(request.getParameter("b1")!=null)
    {
    

//String client_id=session.getAttribute("lgid").toString();
String categoryid=request.getParameter("ddlcategory");
String tech_id=request.getParameter("ddltech");
String pname =request.getParameter("txt_pname");
String duration =request.getParameter("txt_duration");
String description =request.getParameter("txt_description");
String budget =request.getParameter("txt_budget");
String str="insert into tbl_clientproject(category_id,tech_id,project_name,project_duration,project_description,project_budget,project_status,client_id)values('"+categoryid+"','"+tech_id+"','"+pname+"','"+duration+"','"+description+"','"+budget+"','0','"+client_id+"')";

      boolean b=obj.insert(str);
      if(b==true)
            out.print("sucess");
      else
          out.print(str);
    }

%>
        <h1><body></h1>
        <form>
		<h1 align="center"><font color="red">Project Details</font></h1>
		<table align="center">
                   
                    
		
           
                
                <tr>
		<td>Category:</td>
		<td><select name="ddlcategory" id="ddlcategory"><option value="ddlcategory">--Select--</option>
                          <%
                            String se1="select * from tbl_category";
                           ResultSet rs1=obj.select(se1);
                           while(rs1.next())
                           { %>
                           <option value="<%=rs1.getString("category_id")%>"><%=rs1.getString("category_name")%></option>
                           <%}
                            %>
		</select></td>
		</tr>
                
                <tr>
		<td>Technology:</td>
		<td><select name="ddltech" id="ddltech"><option value="ddltech">--Select--</option>	
                          <%
                            String se3="select* from tbl_technology";
                           ResultSet rs2=obj.select(se3);
                           while(rs2.next())
                           { %>
                           <option value="<%=rs2.getString("tech_id")%>"><%=rs2.getString("tech_name")%></option>
                           <%}
                            %>
		</select></td>
		</tr>
                
               
		<tr>
		<td>Project Name:</td>
		<td><input type="textbox" id="txt_pname" name="txt_pname"></td>
		</tr>
                
		<tr>
		<td>Duration:</td>
		<td><input type="textbox" id="txt_duration" name="txt_duration"></td>
		</tr>
                
                <tr>
		<td>Description:</td>
                <td><textarea id="txt_description" name="txt_description"></textarea></td>
		</tr>
		<tr>
                    
                 <tr>
		<td>Budget:</td>
		<td><INPUT TYPE="TEXTBOXT" id="txt_budget" name=txt_budget></td>
		</tr>   
                
		<tr>
                <td>
                    <input type="submit" name="b1" value="Submit"></td>

		<td><input type="reset" name="b2" value="Reset">
		</td></tr>
		</table>
        </form>
                <form>
                 <table align="center">
                 <tr>
                    <th>Project Name</th>
                    <th>Project Duration</th>
                    <th>Project Description</th>
                  <th>Project Budget</th>
                  
                
                
                </tr>
                                   
                                   
                    
                    
                        <%
                        String str="select * from tbl_clientproject where client_id='"+client_id+"'";
                         ResultSet rs3=obj.select(str);
                         while(rs3.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs3.getString("project_name")%>
                             </td>
                          <td>
                                 <%=rs3.getString("project_duration")%>
                             </td>
                         <td>
                                 <%=rs3.getString("project_description")%>
                             </td>
                        <td>
                                 <%=rs3.getString("project_budget")%>
                             </td>
                         </tr>
                        
                        <%
                         }
                        %>
                        
                   <td>
                   </td>
               
            </table>
        </form>


    
    </body>
</html>
