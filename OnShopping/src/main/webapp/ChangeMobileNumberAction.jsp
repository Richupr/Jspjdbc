<%@page import="pack.ConnectionProvider" %>
 <%@page import="java.sql.*" %>
 <%
 
 String email=session.getAttribute("email").toString();
 String mobilenumber=request.getParameter("mobilenumber");
 String password=request.getParameter("password");
 int check=0;
 try
 {
  Connection con=ConnectionProvider.getcon();
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	  while(rs.next())
	  {
	  check=1;
	  st.executeUpdate("update users set mobilenumber='"+mobilenumber+"' where email='"+email+"'");
	  response.sendRedirect("ChangeMobileNumber.jsp?msg=done");
	  }
	  if(check==0)
	  
	  	  response.sendRedirect("ChangeMobileNumber.jsp?msg=wrong");
	  }
	  
	  catch(Exception e)
	  {
	  }
	  %>