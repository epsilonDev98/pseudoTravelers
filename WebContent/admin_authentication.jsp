<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Authentication</title>
</head>
<body>
	<%
	String admin_username,admin_password,temp_username,temp_password;
	admin_username=request.getParameter("admin_username");
	admin_password=request.getParameter("admin_password");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from travel_admin");
		while(rs.next())
		{
			temp_username=rs.getString(1);
			temp_password=rs.getString(2);
			if(temp_username.equals(admin_username))
			{
				if(temp_password.equals(admin_password))
				{ 
					request.getRequestDispatcher("admin_role.jsp").forward(request, response);
					break;
				}
				else {
					System.out.println("Wrong Password");
					break;
				}
			}
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	} %>
</body>
</html>