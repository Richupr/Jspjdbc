 <%@page import="pack.ConnectionProvider" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email)&&"admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("admin/admin.jsp");
}
else
{
	int z=0;
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'&& password='"+password+"'");
		while(rs.next())
		{
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
			response.sendRedirect("Login.jsp?msg=notexist");
		
	}
	catch(Exception e)
	{
		response.sendRedirect("Login.jsp?msg=invalid");

	}
}
%>
</body>
</html>