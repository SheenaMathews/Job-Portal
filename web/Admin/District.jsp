<%-- 
    Document   : District
    Created on : Aug 12, 2017, 9:15:27 AM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
      String district="",id="",sid="";
                     if(request.getParameter("del")!=null)
                         {                  
                             String de=request.getParameter("del");
                                  
                             String delete="delete from tbl_district where district_id="+de;
                             boolean b=obj.insert(delete);
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
                                sid=rs.getString("state_id");
                                
                            }
                        }
    
    
    
    
    
  
    if(request.getParameter("b1")!=null)
    {
        
        String name=request.getParameter("txt_dname");
          if(!request.getParameter("hid").equals(""))
        {
            
            String up=request.getParameter("hid");
            String update="update tbl_district set district_name='"+name+"' where district_id="+up;
            boolean b=obj.insert(update);
        }
        else
      
          {
            String str="insert into tbl_district(district_name,state_id)value('"+name+"','"+sid+"')";
            boolean b=obj.insert(str);
            if(b==true)
                        out.print("success");
            else
                        out.print(str);
    }
       
    }
%>
<html>
    <head>
        <script>
	function check()
	{
		var sn=document.getElementById("txt_dname").value;
		var s=document.getElementById("sel").value;
              		if(sn=="")
		{
			alert("State required");
			return false;
		}
		
                		else if(s=='se')
		{
			alert("Select from listbox");
			return false;
		}
            }
</script>
    </head>
    <body>
        
           
        <form>
	<b>
	<table align="center">
            
             <input type="hidden" name="hid" value="<%=id%>">
	
		<tr>
		<td>State_Name:</td><td>
		<select name="se" id="se" ><option value="se"  >--Select--</option>
                    <%
                    
                    String sel="select * from tbl_state";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    {%>
                    <option value="<%=rs.getString("state_id")%>" <%if (rs.getString("state_id").equals(sid)){%>selected="true"  <%} %>>
                            <%=rs.getString("state_name")%></option>
                    <%}
                    %>
                    
                    
                    
			
		</select></td>
	</tr>
	<tr>
		<td>District_name:</td><td><input type="textbox" id="txt_dname" name="txt_dname" value="<%=district%>"></td>
	</tr>
	<tr>
	<td><input type="submit" name="b1" Onclick="return check()" value="SUBMIT"></td>
	<td><input type="reset" name="b2" value="CANCEL"></td>
	</tr>
	</table>
	</b>
</form>
        <form>
            
            <table align="center">
               <tr> <th>Districts</th></tr>
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
                        <a href="District.jsp?ed=<%=rs1.getString("district_id")%>">Edit</a>
                    </td>
                    <td>
                        <a href="District.jsp?del=<%=rs1.getString("district_id")%>">Delete</a>
                       
                      
                             </td>
                        
                </tr>
                    
                    <%
                         
                     }
                     %>
                     
                    <td>
                        
                    </td>
                </tr>
                </table>
            </form>
    </body>
</html>

