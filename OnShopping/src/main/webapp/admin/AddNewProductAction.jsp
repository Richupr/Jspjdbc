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
    	PreparedStatement stmt=con.prepareStatement("insert into addproduct values(?,?,?,?,?)");
    	stmt.setString(1,id);
    	stmt.setString(2,name);
    	stmt.setString(3,category);
    	stmt.setString(4,price);
    	stmt.setString(5,active);
    	stmt.executeUpdate();
    	response.sendRedirect("AddNewProduct.jsp?msg=done");
    	
    }  	
    		
    catch(Exception e)
    {
    	response.sendRedirect("AddNewProduct.jsp?msg=invalid");

    }

    %>