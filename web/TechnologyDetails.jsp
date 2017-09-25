<%-- 
    Document   : TechnologyDetails
    Created on : Sep 25, 2017, 10:16:38 AM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<!DOCTYPE html>
 <%
     String tech="",id="";
     if(request.getParameter("dl")!=null)
                            {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_technology where tech_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
    }
       if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_technology where tech_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
               id=rs.getString("tech_id");
              tech=rs.getString("tech_name");
              
              
           }
       }

       
       
       
    if(request.getParameter("b1")!=null)
    {
    
String tname=request.getParameter("txt_techname");
if(!request.getParameter("hid").equals(""))
{
String up=request.getParameter("hid");
String update="update tbl_technology set tech_name='"+tname+"' where tech_id="+up;
boolean b=obj.insert(update);
}
else
{
   
String str="insert into tbl_technology(tech_name)value('"+tname+"')";

      boolean b=obj.insert(str);
      if(b==true)
            out.print("sucess");
      else
          out.print(str);
    }

}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
		<h1 align="center"><font color="red">TECHNOLOGY</font></h1>
		<table align="center">
                     <input type="hidden" name="hid" value="<%=id%>">
		<tr>
		<td>Technology Name:</td>
                <td><INPUT TYPE="TEXTBOXT" placeholder="Enter the Name" id="techname" name=txt_techname value="<%=tech%>"></td>
		</tr>
		<tr><td>
		<input type="submit" name="b1" value="submit">

		<input type="reset" name="b2" value="reset">
		</td></tr>
		</table>
		</form>
        <form>
                               <table align="center">
                <tr><th>Technologies</th></tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_technology";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("tech_name")%>
                             </td>
                          
                         
                         <td>
                             <a href="TechnologyDetails.jsp?ed=<%=rs1.getString("tech_id")%>">Edit</a>
                         </td>
                         
                        <td>
                            <a href="TechnologyDetails.jsp?dl=<%=rs1.getString("tech_id")%>">Delete</a>
                           
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
