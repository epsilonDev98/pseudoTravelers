<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search For Buses</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/destinations.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from route");
		Cookie c[]=request.getCookies();
		%>
			<h3 id="name_banner">Welcome <%=c[0].getValue() %></h3>
			<table>
			<tr>
				<td class="list_heading"><h2>Source <i class="fas fa-bus"></i></h2></td>
				<td class="list_heading"><h2>Destination <i class="fas fa-bus"></i></h2></td>
				<td class="list_heading"><h2>Time <i class="fas fa-clock"></i></h2></td>
				<td class="list_heading"><h2>Status <i class="fas fa-check"></i></h2></td>
			</tr>
			<%
		while(rs.next())
		{ %>
			
			<tr>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				
				<%int i=Integer.parseInt(rs.getString(4));
					String shift,res;
					int temp=0,q;
					if(i/100<=12)
					{
						shift="A.M";
						temp=(i/100);
					}
					else{
						shift="P.M";
						temp=(i/100)-12;
					}
					q=i%100;
					res=temp+":"+q+" "+shift;
					%>
				
				<td><%= res %></td>
				<td>
				<form action="bus_details.jsp" method="post">
					<input type="hidden" value="<%= rs.getString(1) %>" name="bus_id">
					<input type="submit" value="Proceed" class="btn btn-success">
				</form>
				</td>
			</tr>
 
		<% } %>
		</table>	
	 <% 
	 }//try
	catch(Exception e){
		System.out.println(e);
	}
	%>
</body>
</html>