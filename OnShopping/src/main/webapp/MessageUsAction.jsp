 <%@page import="pack.ConnectionProvider" %>
 <%@page import="java.sql.*" %>
 
 
 <% 
 String email=session.getAttribute("email").toString();
 String subject=request.getParameter("subject");
 String body=request.getParameter("body");
	try{
	
	  Connection con=ConnectionProvider.getcon();
	  PreparedStatement ps =con.prepareStatement("insert into messageus(email,subject,body) values(?,?,?)");
	 ps.setString(1,email);
	 	 ps.setString(2,subject);
	 	 ps.setString(3,body);
	 	 ps.executeUpdate();
	 	 response.sendRedirect("MessageUs.jsp?msg=valid");

	 	 }
	 	 catch(Exception e)
	 	 {
	 	 	 	 response.sendRedirect("MessageUs.jsp?msg=invalid");
	 	 }
	%>
	 	 