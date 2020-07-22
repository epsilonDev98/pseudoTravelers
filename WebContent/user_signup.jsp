<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<%
	String user_username,user_password,user_email,user_mobile;
	user_username=request.getParameter("user_username");
	user_password=request.getParameter("user_password");
	user_email=request.getParameter("user_email");
	user_mobile=request.getParameter("user_mobile");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		PreparedStatement pstmt = con.prepareStatement(" insert into travel_user values (?,?,?,?)");
		pstmt.setString(1,user_username);
		pstmt.setString(2,user_password);
		pstmt.setString(3,user_email);
		pstmt.setString(4,user_mobile);
		pstmt.executeUpdate();
		request.getRequestDispatcher("/loginuser.html").forward(request, response);
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
 %>
</body>
</html>