import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class admin_servlet
 */
@WebServlet("/admin_servlet")
public class admin_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
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
						pw.println("LOGIN SUCCESS");
						break;
					}
					else {
						pw.println("Wrong Password");
						break;
					}
				}
			}
		}
		catch(Exception e)
		{
			pw.println(e);
		}
		 
	}

}
