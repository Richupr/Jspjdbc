
 <%@page import="pack.ConnectionProvider" %>
 <%@page import="java.sql.*" %>
 <%@include file="adminheader.jsp" %>
 <%@ include file="../footer.jsp" %><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       <%
       try
       {
       Connection con=ConnectionProvider.getcon();
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select * from messageus");
       while(rs.next())
       {
       %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
          </tr>
         <%}}
       catch(Exception e)
       {
       }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>