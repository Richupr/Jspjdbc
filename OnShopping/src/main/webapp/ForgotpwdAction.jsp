<%@page import="pack.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");
int check=0;
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobilenumber+"' and securityquestion='"+securityquestion+"' and answer='"+answer+"'");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
		response.sendRedirect("Forgotpwd.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("Forgotpwd.jsp?msg=invalid");
	}
}
catch(Exception e)
{
}
%>
