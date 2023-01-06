<%@page import="java.time.LocalDate"%>
<%@ include file="navbar.jsp" %>
<%@ include file="conn.jsp" %>
<html>
  <body onload="makeActive('emp')">
  <%
  String eid=request.getParameter("eid");
  String cd=LocalDate.now().toString();
  PreparedStatement ps=cn.prepareStatement("select name from employee where eid=?");
  ps.setString(1,eid);
  ResultSet rst=ps.executeQuery();
  rst.next();
  String name=rst.getString(1);
  %>
  <div class='dvv'>
    <label class='lahu'>View date wise report of <%=name%></label>
  </div>
   <table class='ta'>
    <tr>
     <td class='pd'>
      <form action='current-date-report2.jsp'>
       <input type="hidden" value="<%=eid%>" name="eid">
       <input type="hidden" value="<%=name%>" name="name">
       <table class='cdta'>
        <tr>
         <td>Current date</td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action='any-date-report2.jsp' method="post">
       <input type="hidden" value="<%=eid%>" name="eid">
       <input type="hidden" value="<%=name%>" name="name">
       <table class='cdta'>
        <tr>
         <td>Any date</td>
         <td><input type='date' class='tb' name='date' max="<%=cd%>" required></td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action="date-between-report2.jsp" method="post">
       <input type="hidden" value="<%=eid%>" name="eid">
       <input type="hidden" value="<%=name%>" name="name">
       <table class='cdta'>
        <tr>
         <td>Date between&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><input type='date' class='tb' id='date1' max="<%=cd%>" name="date1" required></td>
         <td><input type='date' class='tb' id='date2' max="<%=cd%>" name="date2" required></td>
         <td align="right"><button class='cdbt' onclick='return compareDate()'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
   </table>
 </body>
</html>