<%-- 
    Document   : Place
    Created on : Aug 12, 2017, 10:04:42 AM
    Author     : student25
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<!DOCTYPE html>

<html>
    <head>
        <script src="../JQuery/jquery.min.js"></script>
            <script>
                function seldist(s)
                {
                   //alert(s);
                    $.ajax({url: "AjaxDistrict.jsp?stateid="+s, success: function(result){
        $("#se2").html(result);
    }});
                   
                }
                </script>
         
            <script>
	function check()
	{
		var sn=document.getElementById("txt_pname").value;
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
        
        <%
    if(request.getParameter("b1")!=null)
    {
       
        String stateid=request.getParameter("se");
        String distid=request.getParameter("se2");
          String pname=request.getParameter("txt_pname");
        String str="insert into tbl_place(state_id,district_id,place_name)values('"+stateid+"','"+distid+"','"+pname+"')";
            boolean b=obj.insert(str);
            if(b==true)
                        out.print("success");
            else
                        out.print(str);
    }
        
%>
        
        
        
        
        
        <form>
	<b>
	<table align="center">
	
		<tr>
		<td>State_Name:</td><td>
		<select name="se" onchange="seldist(this.value)"  >
                    <option value="sel"  >--Select--</option>
                    <%
                    
                    String sel="select * from tbl_state";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    {%>
                        <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                    <%}

                      %>
                      
                      <tr>
		<td>District_Name:</td><td>
		<select name="se2" id="se2" ><option value="se2"  >--Select--</option>
                   
                      </select></td>
	</tr>
                    
                    
                    
			
		</select></td>
	</tr>
        
        
        
        
	<tr>
		<td>Place_name:</td><td><input type="textbox" id="txt_pname" name="txt_pname"></td>
	</tr>
	<tr>
	<td><input type="submit" name="b1" Onclick="return check()" value="SUBMIT"></td>
	<td><input type="reset" name="b2" value="CANCEL"></td>
	</tr>
	</table>
	</b>
</form>
    </body>
</html>

