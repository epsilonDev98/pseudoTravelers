<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Bus</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style type="text/css">
body{
	background-color: aqua;
}
table{
  		font-size: 2rem;
  		text-content: center;
  	}
  	td{
  		padding: 0 3rem;
  	}
  	#heading{
  		background-color: lightblue;
  		font-size: 3rem;
  	}

  	.container{
  		margin-top: 20rem;
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
	    <!-- Navbar Right Side -->
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="loginuser.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      <li><a href="adminlogin.html"><span class="glyphicon glyphicon-log-in"></span> Admin Panel</a></li>
	      <li><a href="user_signup.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    	</ul>
	  </div>
	</nav> 
	<form action="removeBusConfirmation.jsp" method="post">
	<div class="container">
		<table>
		<tr id="heading">
			<td>Bus Id</td>
		</tr>
		<tr>
			<td><input type="text" name="removebus_id"></td>
		</tr>
		<br>
		<input type="submit" value="Remove Bus" class="btn btn-lg btn-danger">
	</table>
	</div>
	</form>
	

	<!-- bootstrap js -->
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- Jquery Cdn -->
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></script>
</body>
</html>