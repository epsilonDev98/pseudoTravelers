<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
</head>
<body>
<%
	String addbus_id,addbus_source,addbus_destination,addbus_time,addbus_no,addbus_price;
	addbus_id=request.getParameter("addbus_id");
	addbus_source=request.getParameter("addbus_source");
	addbus_destination=request.getParameter("addbus_destination");
	addbus_time=request.getParameter("addbus_time");
	addbus_no=request.getParameter("addbus_no");
	addbus_price=request.getParameter("addbus_price");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		PreparedStatement pstmt = con.prepareStatement("insert into route values(?,?,?,?)");
		pstmt.setString(1, addbus_id);
		pstmt.setString(2, addbus_source);
		pstmt.setString(3, addbus_destination);
		pstmt.setString(4, addbus_time);
		pstmt.execute();
		PreparedStatement pstmt1 = con.prepareStatement("insert into bus_detail values(?,?,?)");
		pstmt1.setString(1, addbus_id);
		pstmt1.setString(2, addbus_no);
		pstmt1.setString(3, addbus_price);
		pstmt1.execute();
		request.getRequestDispatcher("admin_role.jsp").forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	} %>
	
</body>
</html>