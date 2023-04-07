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
 * Servlet implementation class sourceDestination
 */ 
@WebServlet("/sourceDestination")
public class sourceDestination extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> sourceList = new ArrayList<>();
        List<String> destinationList = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root", "password");
            
            // Retrieve the list of sources
            preparedStatement = connection.prepareStatement("SELECT DISTINCT sourceOfFlight FROM flights");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sourceList.add(resultSet.getString("sourceOfFlight"));
            }
            
            // Retrieve the list of destinations
            preparedStatement = connection.prepareStatement("SELECT DISTINCT destination FROM flights");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                destinationList.add(resultSet.getString("destination"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { resultSet.close(); } catch (Exception e) { }
            try { preparedStatement.close(); } catch (Exception e) { }
            try { connection.close(); } catch (Exception e) { }
        }
        
        // Store the lists as attributes in the request object
        request.setAttribute("sourceList", sourceList);
        request.setAttribute("destinationList", destinationList);
        
        // Forward the request to the JSP page
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminHomePage.jsp");
        requestDispatcher.forward(request, response);
    }
}
