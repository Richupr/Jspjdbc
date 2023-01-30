<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css"><title>Login Page</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='container'>
	<div class='signup'>
		<form action="LoginAction.jsp" method="post">
		<input type="email" name="email" placeholder="Enter Email Address" required>
		
		<input type="password" name="password" placeholder="Enter Password" required>
		<input type="submit" value="login">
		</form>
		<h2><a href="SignUp.jsp">SignUp</a></h2>
		<h2><a href="Forgotpwd.jsp">Forgot Password</a></h2>
		
	</div>
	  <div class='whysignLogin'>
	  
	<%
	String msg=request.getParameter("msg");
	if("notexist".equals(msg))
		{%>
			<h1> Incorrect user name or password!!!!!!!!!!</h1>	
		<% }
	if("invalid".equals(msg))
			{%>
				<h1>Invalid</h1>
			<%} 
%>
	
	

	
		<span class="text1">Real-Time Beauty ..Now at Your Fingertips..... </span>
		<span class="text2">Enjoy Your Shopping With GrayWayOnlineStore</span>

    <p>Empowering Brands Across the Grobe.</p>
</div>

</div>
</body>
</html>