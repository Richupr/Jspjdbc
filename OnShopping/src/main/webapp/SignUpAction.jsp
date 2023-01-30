 <%@page import="pack.ConnectionProvider" %>
    <%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityquestion=request.getParameter("securityquestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try
{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement stmt=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	stmt.setString(1,name);
	stmt.setString(2,email);
	stmt.setString(3,mobilenumber );
	stmt.setString(4,securityquestion);
	stmt.setString(5,answer);
	stmt.setString(6,password);
	stmt.setString(7,address);
	stmt.setString(8,city);
	stmt.setString(9,state);
	stmt.setString(10,country);
	stmt.executeUpdate();
	response.sendRedirect("SignUp.jsp?msg=valid");
	}
catch(Exception e)

	{
	response.sendRedirect("SignUp.jsp?msg=invalid");
	}
%>