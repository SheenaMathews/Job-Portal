<%-- 
    Document   : DistrictDetails
    Created on : Oct 3, 2017, 10:46:58 AM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
     String district="",id="";
     if(request.getParameter("dl")!=null)
                            {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_district where district_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
    }
       if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_district where district_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
               id=rs.getString("district_id");
             district=rs.getString("district_name");
              
              
           }
       }

       
       
       
    if(request.getParameter("b1")!=null)
    {
    
String dname=request.getParameter("txt_district");
if(!request.getParameter("hid").equals(""))
{
String up=request.getParameter("hid");
String update="update tbl_district set district_name='"+dname+"' where district_id="+up;
boolean b=obj.insert(update);
}
else
{
   
String str="insert into tbl_district(district_name)value('"+dname+"')";

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
		<h1 align="center"><font color="red">DISTRICT</font></h1>
		<table align="center">
                    
                    <input type="hidden" name="hid" value="<%=id%>">
		<tr>
		<td>District Name:</td>
		<td><INPUT TYPE="TEXTBOXT" id="district" name=txt_district value="<%=district%>"></td>
		</tr>
		<tr><td>
		<input type="submit" name="b1" value="submit">

		<input type="reset" name="b2" value="reset">
		</td></tr>
		</table>
		</form>
                 <form>
                               <table align="center">
                <tr><th>District</th></tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_district";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("district_name")%>
                             </td>
                          
                         
                         <td>
                             <a href="DistrictDetails.jsp?ed=<%=rs1.getString("district_id")%>">Edit</a>
                         </td>
                         
                        <td>
                            <a href="DistrictDetails.jsp?dl=<%=rs1.getString("district_id")%>">Delete</a>
                           
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

    

