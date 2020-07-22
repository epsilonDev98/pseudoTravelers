<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK THE TICKETS</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bus_details.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table{
  		font-size: 2rem;
  		text-align:center;
  		margin-top: 8rem;
  	}
  	td{
  		padding: 0 3rem;
  	}
  	#heading{
  		background-color: lightblue;
  	}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
	  		<div class="container-fluid">
	    	<div class="navbar-header">
	      <a class="navbar-brand" href="landing.html">PSEUDO TRAVELLERS</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="landing.html">Home</a></li>
	    </ul>
	  </div>
	</nav> 

<%
try{
	Cookie c[]=request.getCookies();
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
	String bus_id_name = request.getParameter("bus_id");
	Cookie newCookie_bus_id_name = new Cookie("bus_id_name_cookie",bus_id_name);
	response.addCookie(newCookie_bus_id_name);
	String str="select * from bus_detail where bus_id = '"+bus_id_name+"'";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(str);
	int i; %>
		<h3 id="name_banner">Welcome <%=c[0].getValue() %>, you are now booking seats in Bus id "<%=bus_id_name %>"</h3>
	<% 
	while(rs.next())
	{
	%>
	<form action="preConfirmation.jsp" method="post">
	<table>
		<tr id="heading">
			<td>Bus Name</td>
			<td>Total number of seat available</td>
			<td>Number of seat you want to book</td>
			<td>Price of 1 seat</td>
			<td>Total Price</td>
		</tr>
		<tr>
			<td><%=bus_id_name %></td>
			<td><%= rs.getString(2)%></td>
			<td>
				<input id="cal" type="number" min="1" max="<%= rs.getString(2) %>" name="no_seat">
			</td>
			<td><span id="single_price"><%= rs.getString(3)%></span></td>
			<td>Rs. <span id="total">0</span></td>
			<td><input type="submit" class="btn btn-primary" value="BOOK NOW"></td>
		</tr>
	</table>
	</form>
	<%} %>
<% }
catch(Exception e)
{
	System.out.println(e);
}
%>

<script>
	var cal=document.querySelector("#cal");
	var display=document.querySelector("#total");
	var price=document.querySelector("#single_price").innerHTML;
	cal.addEventListener("change",function()
			{
				display.innerHTML=((Number(cal.value))*(Number(price)));
			});
</script>

</body>
</html>