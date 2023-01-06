<%@page import="com.cetpa.TimeAndDate"%>
<%@ include file='navbar.jsp' %>
<%@ include file='conn.jsp' %>
<html>
 <body onload="makeActive('emp')">
 <%
 String date1=request.getParameter("date1");
 String date2=request.getParameter("date2");
 String d1=TimeAndDate.changeDateFormat(date1);
 String d2=TimeAndDate.changeDateFormat(date2);
 PreparedStatement ps=cn.prepareStatement("select * from empoutin where eid=? and date between ? and ?");
 ps.setString(1,request.getParameter("eid"));
 ps.setString(2,d1);
 ps.setString(3,d2);
 ResultSet rst=ps.executeQuery();
 %>
 <div class='dvv'>
     <label class='lahu'>Report of date between <%=d1%> and <%=d2%> of <%=request.getParameter("name")%></label>
  </div>
  <div class='container'>
   <div class='card col-md-12 mx-auto'>
    <div class='card-body'>
     <div class='dv'>
      <%
      if(!rst.next())
      {
    	  %>
    	  <label style='color:red' class='lah'>No record found</label>
    	  <br><br>
    	  <button class='btr' onclick='history.back()'>Back</button>
    	  <%
    	  return;
      }
      %>
     </div>
     <div class='table scrollit'>
     <table class='table table-hover la'>
      <thead>
       <tr>
        <th class='las'>S.No</th><th class='las'>Employee id</th>
        <th class='las'>Out Time</th><th class='las'>In Time</th>
        <th class='las'>Total Time</th><th class='las'>Date</th>
       </tr>
      </thead>
      <tbody>
      <%
      int sn=0;
      do
      {
    	  String eid=rst.getString(2);
    	  String in=rst.getString(4);
    	  String tot=rst.getString(5);
    	  %>
    	  <tr>
    	   <td><%=++sn%></td>
    	   <td><a style='text-decoration: underline' href='employee-details.jsp?empid=<%=eid%>'><%=eid%></a></td>
    	   <td><%=rst.getString(3)%></td>
    	   <%if(in.equals("Not in yet")){%>
    	   		<td style='color:red'><%=in%></td>
    	   <%}else{ %>		
    	   		<td><%=in%></td>
    	   	<%}%>	
    	   <%if(tot.equals("Not applicable")){%>
    	   		<td style='color:red'><%=tot%></td>
    	   <%}else{ %>		
    	   		<td><%=tot%></td>
    	   	<%}%>	
    	   <td><%=rst.getString(6)%></td>
    	  </tr>
    	  <%
      }while(rst.next());
      %>
      </tbody>
     </table>
     </div>
    </div>
   </div>
  </div>
  <div class='dvv'>
	 <button class='btr' onclick='history.back()'>Back</button>
  </div>
 </body>
</html>