<%-- 
    Document   : AjaxDistrict
    Created on : Aug 12, 2017, 11:35:02 AM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
   
    <body>
        <%
            String stateid=request.getParameter("stateid");
          
            
     
                    
                    String sel="select * from tbl_district where state_id="+stateid;
                    
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    {%>
                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                    <%}
                    %>
                    
                    
                    
	
</html>
