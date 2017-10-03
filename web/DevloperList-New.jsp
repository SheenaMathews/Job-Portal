<%-- 
    Document   : DevloperList-New
    Created on : Oct 3, 2017, 10:53:48 AM
    Author     : student26
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
    <%       
                if(request.getParameter("ac")!=null)
                     {
                            String de=request.getParameter("ac");
                            String acQry="update tbl_developer set dev_status=1 where dev_id="+de;
                             boolean b = obj.insert(acQry);
                    }
        
        
   if(request.getParameter("rej")!=null)
                     {
                            String de=request.getParameter("rej");
                            String rejQry="update tbl_developer set dev_status=2  where dev_id="+de;
                             boolean b = obj.insert(rejQry);
                    }
        
        %>
        
        
        
        
        
        
        <form>
                <table align="center">
                <tr>
                    <th>DeveloperName</th>
                    <th>Address</th>
                    <th>Email</th>
                  <th>Gender</th>
                  <th>Qualification</th>
                  <th>Experience</th>
                  <th>Place</th>
                
                
                </tr>
                <tr>
                    
                        <%
                        String str="select * from tbl_developer d inner join tbl_place p on d.place_id=p.place_id where d.dev_status=0";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("dev_name")%>
                             </td>
                          
                         <td>
                                 <%=rs1.getString("dev_address")%>
                          </td>
                           
                         <td>
                                 <%=rs1.getString("dev_email")%>
                          </td>
                             
                              
                         <td>
                                 <%=rs1.getString("dev_gender")%>
                          </td>
                          
                           
                         <td>
                                 <%=rs1.getString("dev_qualification")%>
                          </td>
                           
                         <td>
                                 <%=rs1.getString("dev_experience")%>
                                
                          </td>
                           
                         <td>
                                 <%=rs1.getString("place_name")%>
                          </td>
                          
                          
                         <td>
                             <a href="DevloperList-New.jsp?ac=<%=rs1.getString("dev_id")%>">Accept</a>
                         </td>
                         
                        <td>
                            <a href="DevloperList-New.jsp?rej=<%=rs1.getString("dev_id")%>">Reject</a>
                           
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
