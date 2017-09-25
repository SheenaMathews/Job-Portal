<%-- 
    Document   : category
    Created on : Sep 23, 2017, 3:11:46 PM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>

<%
     String cat="",id="";
     if(request.getParameter("dl")!=null)
                            {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_category where category_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
    }
       if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_category where category_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
               id=rs.getString("category_id");
              cat=rs.getString("category_name");
              
              
           }
       }

       
       
       
    if(request.getParameter("b1")!=null)
    {
    
String cname=request.getParameter("txt_catname");
if(!request.getParameter("hid").equals(""))
{
String up=request.getParameter("hid");
String update="update tbl_category set category_name='"+cname+"' where category_id="+up;
boolean b=obj.insert(update);
}
else
{
   
String str="insert into tbl_category(category_name)value('"+cname+"')";

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
		<h1 align="center"><font color="red">CATEGORY</font></h1>
		<table align="center">
                    
                    <input type="hidden" name="hid" value="<%=id%>">
		<tr>
		<td>Category Name:</td>
		<td><INPUT TYPE="TEXTBOXT" placeholder="Enter the Name" id="catname" name=txt_catname value="<%=cat%>"></td>
		</tr>
		<tr><td>
		<input type="submit" name="b1" value="submit">

		<input type="reset" name="b2" value="reset">
		</td></tr>
		</table>
		</form>
                 <form>
                               <table align="center">
                <tr><th>Categories</th></tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_category";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("category_name")%>
                             </td>
                          
                         
                         <td>
                             <a href="CategoryDetails.jsp?ed=<%=rs1.getString("category_id")%>">Edit</a>
                         </td>
                         
                        <td>
                            <a href="CategoryDetails.jsp?dl=<%=rs1.getString("category_id")%>">Delete</a>
                           
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
