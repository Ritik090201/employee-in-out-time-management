<%@ include file='navbar.jsp' %>
<%@ include file='conn.jsp' %>
<html>
 <body>
    <%
    String eid=request.getParameter("empid");
    PreparedStatement ps=cn.prepareStatement("select * from employee where eid=?");
    ps.setString(1,eid);
    ResultSet rst=ps.executeQuery();
    rst.next();
    %>
     <table class='ta' style='width:50%' border='3'>
	   <tr style='background-color:orange;color:white'>
	    <td colspan="2" align="center" class='la pd'>Employee Details</td>
	   </tr>
	   <tr>
	    <th align="left">Employee Id</th>
	    <td class='pd'><%=eid%></td>
	   </tr>
	   <tr>
	    <th align="left">Employee name</th>
	     <td class='pd'><%=rst.getString(2)%></td>
	   </tr>
	   <tr>
	    <th align="left">Employee Department</th>
	     <td class='pd'><%=rst.getString(3)%></td>
	   </tr>
	 </table>
	 <div class='dvv'>
	    <button class='btr' onclick='history.back()'>Back</button>
	 </div>
 </body>
</html>    