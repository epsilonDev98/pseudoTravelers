<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style type="text/css">
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
  	#status{
  		background-color: green;
  		color: white;
  	}
  	p{
  		margin-top: 6rem;
  	}

  	#printableArea{
  		border: 1px solid black;
  		margin-top: 5rem;
  	}
  </style>
</head>
<body>
<%
try {
	Cookie c[]= request.getCookies();
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from travel_user where user_name = '"+c[0].getValue()+"'");
%>
	<div class="container">
		<div id="printableArea">
		<% while(rs.next()){ %>
			<h1><%=rs.getString(1)%></h1>
			<h4><%=rs.getString(3)%> || <%=rs.getString(4)%></h4>
			<%} %>
			<table>
				<tr id="heading">
					<td>Bus Id</td>
					<td>Source</td>
					<td>Destination</td>
					<td>Time</td>
					<td>Seat</td>
					<td>Price</td>
					<td>Total</td>
					<td>Status</td>
				</tr>
				<tr>
					<td><%=c[1].getValue()%></td>
					<% ResultSet rs1 = stmt.executeQuery("select * from route where bus_id ='"+c[1].getValue()+"'");
					while(rs1.next()){%>
					<td><%=rs1.getString(2)%></td>
					<td><%=rs1.getString(3)%></td>
					<%int i=Integer.parseInt(rs1.getString(4));
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
					<td><%=res%></td>
					<%} %>
					<td><%=c[2].getValue()%></td>
					<% ResultSet rs2 = stmt.executeQuery("select * from bus_detail where bus_id ='"+c[1].getValue()+"'");
					while(rs2.next()){%>
					<td>Rs. <span><%=rs2.getString(3)%></span></td>
					<%int i=Integer.parseInt(rs2.getString(3))*Integer.parseInt(c[2].getValue()); %>
					<td>Rs. <span><%=i %></span></td>
					<%} %>
					<td id="status">Paid</td>
				</tr>
			</table>
			<p><strong>Customer Service :</strong> help@nomadstravel.com <br>
			   <strong>Helpline :</strong> +9154005400
			</p>
		</div>
		<input type="button" onclick="printDiv('printableArea')" value="Print Invoice" />
	</div>
<%}
catch(Exception e)
{
System.out.println(e);
}
%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">
    function printDiv(divName) {
		     var printContents = document.getElementById(divName).innerHTML;
		     var originalContents = document.body.innerHTML;
		     document.body.innerHTML = printContents;
		     window.print();
		     document.body.innerHTML = originalContents;
		}
</script>

</body>
</html>