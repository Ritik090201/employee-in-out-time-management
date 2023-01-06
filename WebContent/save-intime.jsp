<%@ page import="com.cetpa.TimeAndDate"%>
<%@ include file="navbar.jsp" %>
<%@ include file="conn.jsp" %>
 <body onload="makeActive('in')">
<%
String eid=request.getParameter("eid");
PreparedStatement ps1=cn.prepareStatement("select outtime from empoutin where eid=? and date=? and intime=?");
ps1.setString(1,eid);
ps1.setString(2,TimeAndDate.getCurrentDate());
ps1.setString(3,"Not in yet");
ResultSet rst=ps1.executeQuery();
if(!rst.next())
{
	%>
	<div class="dv">
	  <label class='lah' style='color:red'>Employee has not been out</label>
	</div>
	<%
	return;
}
PreparedStatement ps2=cn.prepareStatement("update empoutin set intime=?,totaltime=? where eid=? and date=?");
String intime=TimeAndDate.getCurrentTime();
String outtime=rst.getString(1);
ps2.setString(1,intime);
ps2.setString(2,TimeAndDate.getTotalTime(intime,outtime));
ps2.setString(3,eid);
ps2.setString(4,TimeAndDate.getCurrentDate());
ps2.executeUpdate();
%>
<div class="dv">
  <label class='lah' style='color:green'>Employee time in has been recorded</label>
</div>
</body>