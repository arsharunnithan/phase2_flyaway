package com.phase2.flyaway;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AirlineServlet
 */
@WebServlet("/AirlineServlet")
public class AirlineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> airlineList = new ArrayList<String>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false", "root",
                    "password");
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT airline FROM flights");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	airlineList.add(resultSet.getString("airline"));
            }
            request.setAttribute("airline", airlineList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminHomePage.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}