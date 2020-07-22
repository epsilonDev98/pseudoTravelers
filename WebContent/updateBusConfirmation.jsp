<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Bus</title>
</head>
<body>
<%
	String updatebus_id,updatebus_source,updatebus_destination,updatebus_time,updatebus_no,updatebus_price;
	updatebus_id=request.getParameter("updatebus_id");
	updatebus_source=request.getParameter("updatebus_source");
	updatebus_destination=request.getParameter("updatebus_destination");
	updatebus_time=request.getParameter("updatebus_time");
	updatebus_no=request.getParameter("updatebus_no");
	updatebus_price=request.getParameter("updatebus_price");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		String str="update route set bus_id='"+updatebus_id+"',bus_start='"+updatebus_source+"',bus_end='"+updatebus_destination+"',time='"+updatebus_time+"' where bus_id='"+updatebus_id+"'";
		Statement stmt=con.createStatement();
		stmt.execute(str);
		str="update bus_detail set bus_id='"+updatebus_id+"',no_seat='"+updatebus_no+"',price='"+updatebus_price+"'";
		stmt.execute(str);
		request.getRequestDispatcher("admin_role.jsp").forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	} %>
	
</body>
</html>