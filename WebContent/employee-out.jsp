<%@ include file="navbar.jsp" %>
<%@ include file="conn.jsp" %>
<html>
 <body onload="makeActive('out')">
  <div class='dv'>
    <label class='lahu'>Employee time out page</label>
  </div>
 <form action="save-outtime.jsp" method="post">
  <div class='dv'>
   <%
   Statement st=cn.createStatement();
   ResultSet rst=st.executeQuery("select * from employee");
   %>
   <select class='tb' name='eid'>
   <%
   while(rst.next())
   {
	 int eid=rst.getInt(1);  
	 %>
	 <option value="<%=eid%>"><%=rst.getString(2)%>(<%=eid%>)</option>
	 <%   
   }
   %>
   </select>
  </div>
  <div class='dv'>
   <button class='btn btn-primary'>Submit</button>
  </div>
 </form> 
 </body>
</html>