<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Authentication</title>
</head>
<body>

Successfully Login Man!   
Now you can enter securely  :)
<a href="home.html"> Click on the link to enter </a>

	<%
	String user_username,user_password,temp_username,temp_password;
	user_username=request.getParameter("user_username");
	user_password=request.getParameter("user_password");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "avesh","avesh");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from travel_user");
		while(rs.next())
		{
			temp_username=rs.getString(1);
			temp_password=rs.getString(2);
			if(temp_username.equals(user_username))
			{
				if(temp_password.equals(user_password))
				{
					Cookie newCookie_username = new Cookie("username_cookie",user_username);
					response.addCookie(newCookie_username);
					request.getRequestDispatcher("/destinations.jsp").forward(request, response);
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
		System.out.println(e +"Exception in User_authentication.jsp");
	} %>
</body>
</html>