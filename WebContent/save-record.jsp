<%@ include file="navbar.jsp" %>
<%@ include file="conn.jsp" %>
<%
String eid=request.getParameter("eid");
PreparedStatement ps1=cn.prepareStatement("select * from employee where eid=?");
ps1.setString(1,eid);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
	%>
	<div class="dv">
  		<label class='lah' style='color:red'>Employee with id <%=eid%> already exists</label>
	</div>
	<%
	return;
}
String name=request.getParameter("name");
String department=request.getParameter("dept");
PreparedStatement ps=cn.prepareStatement("insert into employee values(?,?,?)");
ps.setString(1,eid);
ps.setString(2,name);
ps.setString(3,department);
ps.executeUpdate();
%>
<div class="dv">
  <label class='lah' style='color:green'>Employee record has been saved successfully</label>
</div>