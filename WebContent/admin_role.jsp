<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin </title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/backui.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
table{
  		font-size: 2rem;
  		text-content: center;
  	}
  	td{
  		padding: 0 3rem;
  	}
  	#heading{
  		
  		font-size: 3rem;
  	}

  	.container{
  		margin-top: 20rem;
  		margin-left: 30rem;
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
<div class="container">
		<table>
		<tr id="heading">
			<td>Add Bus</td><br><br>
			<td>Update Bus</td><br><br>
			<td>Remove Bus</td>
		</tr>
		<tr>
			<td><a href="addbus.jsp"><button class="btn btn-lg btn-primary">Click Here</button></a></td><br><br>
			<td><a href="updatebus.jsp"><button class="btn btn-lg btn-success">Click Here</button></a></td><br><br>
			<td><a href="deletebus.jsp"><button class="btn btn-lg btn-danger">Click Here</button></a></td>
		</tr>
	</table>
	</div>
</body>
</html>