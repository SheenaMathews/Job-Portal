<%-- 
    Document   : PlaceDetails
    Created on : Oct 3, 2017, 10:47:08 AM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    
    String place="",id="",did="";
    
    
    
    
     if(request.getParameter("dl")!=null)
                     {
                            String de=request.getParameter("dl");
                            String delete="delete from tbl_place where place_id="+de;
                           
                             boolean b = obj.insert(delete);
                                    
                            
                            
                    }
     
     
     
     
     
     
       if(request.getParameter("ed")!=null)
       {
           String edi=request.getParameter("ed");
           String edit="select * from tbl_place where place_id="+edi;
           ResultSet rs=obj.select(edit);
           if(rs.next())
           {
              id=rs.getString("place_id");
              place=rs.getString("place_name");
              did=rs.getString("district_id");
              
           }
       }
       
       
       
       
       

    if(request.getParameter("b1")!=null)
    {
    
                String pname=request.getParameter("txt_place");
                String dID=request.getParameter("ddldistrict");

                if(!request.getParameter("hid").equals(""))
                {
                    String up=request.getParameter("hid");
                    String update="update tbl_place set place_name='"+pname+"',district_id='"+dID+"' where place_id="+up;
                    boolean b=obj.insert(update);
                }
                else
                {
                    String str="insert into tbl_place(place_name,district_id)values('"+pname+"','"+dID+"')";
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
		<h1 align="center"><font color="red">PLACE</font></h1>
		<table align="center">
                     <input type="hidden" name="hid" value="<%=id%>">
               <tr>
		<td>District:</td>
		<td>
                    <select name="ddldistrict" id="ddldistrict">
                        <option value="se">--Select--</option>
                        <%
                            String se="select* from tbl_district";
                           ResultSet rs=obj.select(se);
                           while(rs.next())
                           { %>
                           <option value="<%=rs.getString("district_id")%>"<%if(rs.getString("district_id").equals(did)){%>selected="true"<%}%>>
                           <%=rs.getString("district_name")%></option>
                           <%}
                            %>
			
		</select>
                </td>
		
		<tr>
		<td>Place:</td>
		<td><INPUT TYPE="TEXTBOXT" id="place" name=txt_place value="<%=place%>"></td>
		</tr>
		<tr><td>
		<input type="submit" name="b1" value="submit">

		<input type="reset" name="b2" value="reset">
		</td></tr>
		</table>
		</form>
                <form>
                              
                    
                    <table align="center">
                <tr><th>Place</th>
                <th>District</th>
                </tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_place s inner join tbl_district c on c.district_id=s.district_id";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("place_name")%>
                             </td>
                           <td>
                                 <%=rs1.getString("district_name")%>
                             </td>
                         
                         <td>
                             <a href="PlaceDetails.jsp?ed=<%=rs1.getString("place_id")%>">Edit</a>
                         </td>
                         
                        <td>
                            <a href="PlaceDetails.jsp?dl=<%=rs1.getString("place_id")%>">Delete</a>
                           
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
