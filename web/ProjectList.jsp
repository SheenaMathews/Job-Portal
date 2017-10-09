<%-- 
    Document   : ProjectList
    Created on : Oct 9, 2017, 12:20:55 PM
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
        
        <form>
                <table align="center">
               <tr>
                    <th>Project Name</th>
                    <th>Project Duration</th>
                    <th>Project Description</th>
                    <th>Project Budget</th>
                                                 
                </tr>
                          
                <tr>
                    
                        <%
                        String str="select * from tbl_technology t inner join tbl_clientproject c on t.tech_id=c.tech_id where c.project_status=1";
                         ResultSet rs1=obj.select(str);
                         while(rs1.next())
                         {
                         %>
                    
                   
               
                         <tr>
                             <td>
                                 <%=rs1.getString("project_name")%>
                             </td>
                          <td>
                                 <%=rs1.getString("project_duration")%>
                             </td>
                         <td>
                                 <%=rs1.getString("project_description")%>
                             </td>
                        <td>
                                 <%=rs1.getString("project_budget")%>
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
