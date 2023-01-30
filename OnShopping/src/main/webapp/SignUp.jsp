<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css"><title>Sign Up</title>
<title>Sign Up</title>
</head>
<body>
<div id='container'>
	<div class='signup'>
		<form action="SignUpAction.jsp" method="post"> 
		<input type="text" name="name" placeholder="Enter Name" required>
		<input type="email" name="email" placeholder="Enter Email Address" required>
		<input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
		<select name="securityquestion" required>
		<option value="What is your first car?"> What is your first car?</option>
		<option value="What is the name of your first pet?">What is the name of your first pet?</option>
		<option value="What elementary school did you attend?">What elementary school did you attend?</option>
		</select>
		<input type="text" name="answer" placeholder="Enter Answer" required>
		<input type="password" name="password" placeholder="Enter Password" required>
	
		<input type="submit" value="SignUp">
		</form>
		 
      <h2><a href="Login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg))
		{%>
			<h1>Successfully Registered!!!!!!!!!!</h1>	
		<% }
	if("invalid".equals(msg))
			{%>
				<h1>Something went wrong</h1>
			<%} 
%>






		<span class="text1">Real-Time Beauty ..Now at Your Fingertips.....</span>
		<span class="text2">Enjoy Your Shopping With GrayWayOnlineStore</span>
		
<p>Empowering Brands Across the Grobe</p>
  </div>
</div>

</body>
</html>