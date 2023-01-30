 <%@page import="pack.ConnectionProvider" %>
    <%@page import="java.sql.*" %>

    <%
    
    String emailid=session.getAttribute("email").toString();
    String id=request.getParameter("id");
    String indec=request.getParameter("quantity");
    int price=0;
    int total=0;
    int quantity=0;
    int final_total=0;
    try
    {
    	Connection con=ConnectionProvider.getcon();
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from cart where email='"+emailid+"' and p_id='"+id+"' and address is NULL");
    	while(rs.next())
    	{
    	price=rs.getInt(4);
    	total=rs.getInt(5);
    	quantity=rs.getInt(3);
    	}
    	if(quantity==1 && indec.equals("dec"))
    	{
    	
    	   response.sendRedirect("MyCart.jsp?msg=notpossible");
    	}
    	
    	else if(quantity !=1 && indec.equals("dec"))
    	{
    		total=total-price;
    		quantity=quantity-1;
    		stmt.executeQuery("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+emailid+"' and p_id='"+id+"' and address is NULL");
    		response.sendRedirect("MyCart.jsp?msg=dec");
    		}
    	else
    	{
    		total=total+price;
    		quantity=quantity+1;
    		stmt.executeQuery("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+emailid+"' and p_id='"+id+"' and address is NULL");
    		response.sendRedirect("MyCart.jsp?msg=inc");
    		
    		}
    }
catch(Exception e)
{
}
%>