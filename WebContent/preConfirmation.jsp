<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pre Confirmation</title>
</head>
<body>
<%
String no_seat=request.getParameter("no_seat");
Cookie newCookie_no_seat = new Cookie("no_seat_cookie",no_seat);
response.addCookie(newCookie_no_seat);
request.getRequestDispatcher("/payment.html").forward(request, response); %>
</body>
</html>