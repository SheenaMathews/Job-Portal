<%-- 
    Document   : State
    Created on : Aug 12, 2017, 9:15:42 AM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
      String state="",id="";
                     if(request.getParameter("del")!=null)
                         {                  
                             String de=request.getParameter("del");
                                  
                             String delete="delete from tbl_state where state_id="+de;
                             boolean b=obj.insert(delete);
                          }
                     
                        if(request.getParameter("ed")!=null)
                        {
                            
                            String edi=request.getParameter("ed");
                            String edit="select * from tbl_state where state_id="+edi;
                            ResultSet rs=obj.select(edit);
                            if(rs.next())
                            {
                                id=rs.getString("state_id");
                                state=rs.getString("state_name");
                                
                            }
                        }
    
    
    
    
    
  
    if(request.getParameter("b1")!=null)
    {
        
        String name=request.getParameter("txt_sname");
          if(request.getParameter("hid")!=null)
        {
            
            String up=request.getParameter("hid");
            String update="update tbl_state set state_name='"+name+"' where state_id="+up;
            boolean b=obj.insert(update);
        }
        else
      
          {
            String str="insert into tbl_state(state_name)value('"+name+"')";
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
		var sn=document.getElementById("txt_sname").value;
                if(sn=="")
		{
			alert("State required");
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
            <td>State_name:</td><td><input type="textbox" id="txt_sname" name="txt_sname" value="<%=state%>"></td>
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
               <tr> <th>States</th></tr>
                <tr>
                    <%
                    
                    String str="select * from tbl_state";
                   ResultSet rs=obj.select(str);
                     while(rs.next())
                     {
                         
                         %>
                    
                <tr>
                    <td>
                        <%=rs.getString("state_name")%>
                    </td>
                    <td>
                        <a href="State.jsp?ed=<%=rs.getString("state_id")%>">Edit</a>
                    </td>
                    <td>
                        <a href="State.jsp?del=<%=rs.getString("state_id")%>">Delete</a>
                       
                      
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

