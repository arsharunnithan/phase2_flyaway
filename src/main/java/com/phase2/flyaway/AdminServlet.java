package com.phase2.flyaway;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection connection = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminName = request.getParameter("adminName");
		String adminPassword = request.getParameter("adminPassword");
		
		RequestDispatcher requestDispatcher = null;
		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false","root","password");
			PreparedStatement preparedStatement = connection.prepareStatement("select * from admin where adminName = ? and adminPassword = ?");
			
			preparedStatement.setString(1, adminName);
			preparedStatement.setString(2, adminPassword);
			
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
			{
				//session.setAttribute("name", resultSet.getString("uname"));
				requestDispatcher = request.getRequestDispatcher("adminHomePage.jsp");
			}else
			{
				request.setAttribute("status", "failed");
				requestDispatcher = request.getRequestDispatcher("loginForAdmin.jsp");
			}
			requestDispatcher.forward(request, response);
		}
			catch (Exception e) {
				// TODO: handle exception
			}
	}
}
