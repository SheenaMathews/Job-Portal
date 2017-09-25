<%-- 
    Document   : subcategory
    Created on : Sep 23, 2017, 3:31:26 PM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    
    String subcat="",id="",cid="";
    
    
    
    
     if(request.getParameter("dl")!=null)
                     {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_subcategory where subcategory_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
                    }
     
     
     
     
     
     
       if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_subcategory where subcategory_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
              id=rs.getString("subcategory_id");
              subcat=rs.getString("subcategory_name");
              cid=rs.getString("category_id");
              
           }
       }
       
       
       
       
       

    if(request.getParameter("b1")!=null)
    {
    
                String sname=request.getParameter("txt_subcatname");
                String CatID=request.getParameter("ddlCategory");

                if(!request.getParameter("hid").equals(""))
                {
                    String up=request.getParameter("hid");
                    String update="update tbl_subcategory set subcategory_name='"+sname+"',category_id='"+CatID+"' where subcategory_id="+up;
                    boolean b=obj.insert(update);
                }
                else
                {
                    String str="insert into tbl_subcategory(subcategory_name,category_id)values('"+sname+"','"+CatID+"')";
                    out.print(str);
                    boolean b=obj.insert(str);
                    if(b==true)
                            out.print("Sucess");
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
		<td>Category:</td>
		<td>
                    <select name="ddlCategory" id="ddlCategory">
                        <option value="se">--Select--</option>
                        <%
                            String se="select* from tbl_category";
                           ResultSet rs=obj.select(se);
                           while(rs.next())
                           { %>
                           <option value="<%=rs.getString("category_id")%>"<%if(rs.getString("category_id").equals(cid)){%>selected="true"<%}%>>
                           <%=rs.getString("category_name")%></option>
                           <%}
                            %>
			
		</select>
                </td>
		
		<tr>
		<td>SubCategory Name:</td>
		<td><INPUT TYPE="TEXTBOXT" id="subcatname" name=txt_subcatname value="<%=subcat%>"></td>
		</tr>
		<tr><td>
		<input type="submit" name="b1" value="submit">

		<input type="reset" name="b2" value="reset">
		</td></tr>
		</table>
		</form>
                <form>
                              
                    
                    <table align="center">
                <tr><th>SubCatgeory</th>
                <th>Catgeory</th>
                </tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_subcategory s inner join tbl_category c on c.category_id=s.category_id";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("subcategory_name")%>
                             </td>
                           <td>
                                 <%=rs1.getString("category_name")%>
                             </td>
                         
                         <td>
                             <a href="SubCategory.jsp?ed=<%=rs1.getString("subcategory_id")%>">Edit</a>
                         </td>
                         
                        <td>
                            <a href="SubCategory.jsp?dl=<%=rs1.getString("subcategory_id")%>">Delete</a>
                           
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
