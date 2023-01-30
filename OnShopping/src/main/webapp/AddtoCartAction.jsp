 <%@page import="pack.ConnectionProvider" %>
 <%@page import="java.sql.*" %>
  <%@include file="header.jsp" %>
  <%@ include file="../footer.jsp" %>
  
 <%
 String emailid=session.getAttribute("email").toString();
 String p_id=request.getParameter("id");
 int quantity=1;
 int p_price=0;
 int total=0;
 int cart_total=0;
 
 int z=0;
 try
 {
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from addproduct where id='"+p_id+"'");
	 while(rs.next())
	 {
		 p_price=rs.getInt(4);
		 total=p_price;
	 }
	ResultSet rs1=stmt.executeQuery("select * from cart where p_id='"+p_id+"' and email='"+emailid+"' and address is NULL");
	while(rs1.next())
	{
		cart_total=rs1.getInt(5);
		cart_total=cart_total+total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		stmt.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where p_id='"+p_id+"' and email='"+emailid+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into cart(email,p_id,quantity,price,total)values(?,?,?,?,?)");
		ps.setString(1,emailid);
		ps.setString(2,p_id);
		ps.setInt(3,quantity);
		ps.setInt(4,p_price);
		ps.setInt(5,total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");

				
	}
 }
 catch(Exception e){
		response.sendRedirect("home.jsp?msg=invalid");

 }
 %>