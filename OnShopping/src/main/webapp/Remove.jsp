 <%@page import="pack.ConnectionProvider" %>
    <%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String p_id=request.getParameter("id");
try
{
Connection con=ConnectionProvider.getcon();
Statement stmt=con.createStatement();
stmt.executeUpdate("delete from cart where email='"+email+"' and p_id='"+p_id+"' and address is NULL");
response.sendRedirect("MyCart.jsp?msg=removed");
}
catch(Exception e)
{
}
%>