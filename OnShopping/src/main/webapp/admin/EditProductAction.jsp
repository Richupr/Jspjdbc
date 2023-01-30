 <%@page import="pack.ConnectionProvider" %>
    <%@page import="java.sql.*" %>
  <%
  String id=request.getParameter("id");
  String name=request.getParameter("name");
  String category=request.getParameter("category");
  String price=request.getParameter("price");
  String active=request.getParameter("active");
  try
  {
  
	   Connection con=ConnectionProvider.getcon();
	   Statement stmt=con.createStatement();
	   stmt.executeUpdate("update addproduct set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	   if(active.equals("no"))
	   {
		   stmt.executeUpdate("delete from addproduct where id='"+id+"' and address is NULL");
		      
	   }
	   
		
response.sendRedirect("AllProductsEditProducts.jsp?msg=done");
  }
  catch(Exception e)
  {
	  response.sendRedirect("AllProductsEditProducts.jsp?msg=invalid");

  }
	   
  %>
   
    