 <%@page import="pack.ConnectionProvider" %>
 <%@page import="java.sql.*" %>
 <%
 String id=request.getParameter("id");
 String email=request.getParameter("email");
 String status="delivered";
 try
 {
 
	   Connection con=ConnectionProvider.getcon();
	   Statement stmt=con.createStatement();
	   stmt.executeUpdate("update cart set status='"+status+"' where p_id='"+id+"' and email ='"+email+"' and address is not NULL");
	   response.sendRedirect("OrdersReceived.jsp?msg=delivered");
	   }
	   catch(Exception e)
	   {
	   	   response.sendRedirect("OrdersReceived.jsp?msg=invalid");
	   
	   }
	   %>