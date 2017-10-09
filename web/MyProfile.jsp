<%-- 
    Document   : MyProfile
    Created on : Oct 9, 2017, 2:28:35 PM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <table align="center">
                <tr>
                    
                    <th>MyProfile</th></tr>
                <tr>
                    
                        <%
                        String client_id=session.getAttribute("lgid").toString();
                        String str="select * from tbl_client c inner join tbl_place p on c.place_id=p.place_id where client_id='"+client_id+"'";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>ClientName</td>
                             <td>
                                 <%=rs1.getString("client_name")%>
                             </td>
                          
                         </tr>
                         <tr>
                             <td>Gender</td>
                             <td>
                                 <%=rs1.getString("client_gender")%>
                             </td>
                          
                         </tr>
                         <tr>
                             <td>ContactNo</td>
                             <td>
                                 <%=rs1.getString("client_contactno")%>
                             </td>
                          
                         </tr>
                         <tr>
                             <td>Email</td>
                             <td>
                                 <%=rs1.getString("client_email")%>
                             </td>
                          
                         </tr>
                           <tr>
                             <td>AddhrNo</td>
                             <td>
                                 <%=rs1.getString("client_aadhrno")%>
                             </td>
                          
                         </tr>
                           <tr>
                             <td>Address</td>
                             <td>
                                 <%=rs1.getString("client_address")%>
                             </td>
                          
                         </tr>
                           <tr>
                             <td>PlaceName</td>
                             <td>
                                 <%=rs1.getString("place_name")%>
                             </td>
                          
                         </tr>
                        
                        <%
                         }
                        %>
                        
                  
               
            </table>
    </body>
</html>
