<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Bus Confirmation</title>
</head>
<body>
<%
	String removebus_id;
	removebus_id=request.getParameter("removebus_id");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		String str="delete from bus_detail where bus_id='"+removebus_id+"'";
		Statement stmt=con.createStatement();
		stmt.execute(str);
		str="delete from route where bus_id='"+removebus_id+"'";
		stmt.execute(str);
		request.getRequestDispatcher("admin_role.jsp").forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	} %>
	
</body>
</html>