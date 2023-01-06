<%@ page import="com.cetpa.*"%>
<%@ include file="navbar.jsp" %>
<%@ include file="conn.jsp" %>
 <body onload="makeActive('out')">
<%
String eid=request.getParameter("eid");
PreparedStatement ps1=cn.prepareStatement("select * from empoutin where eid=? and date=? and intime=?");
ps1.setString(1,eid);
ps1.setString(2,TimeAndDate.getCurrentDate());
ps1.setString(3,"Not in yet");
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
	%>
	<div class="dv">
	  <label class='lah' style='color:red'>Employee is already out</label>
	</div>
	<%
	return;
}
PreparedStatement ps=cn.prepareStatement("insert into empoutin(eid,outtime,intime,totaltime,date) values(?,?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,TimeAndDate.getCurrentTime());
ps.setString(3,"Not in yet");
ps.setString(4,"Not applicable");
ps.setString(5,TimeAndDate.getCurrentDate());
ps.executeUpdate();
%>
<div class="dv">
  <label class='lah' style='color:green'>Employee time out has been recorded</label>
</div>
</body>