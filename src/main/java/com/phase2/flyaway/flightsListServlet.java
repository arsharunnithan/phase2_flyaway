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

import com.phase2.factors.Flight;

/**
 * Servlet implementation class flightsListServlet
 */
@WebServlet("/flightsListServlet")
public class flightsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection connection = null;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        List<Flight> flights = new ArrayList<>();
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false","root","password");
	            PreparedStatement preparedStatement = connection.prepareStatement("select * from flights");
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while(resultSet.next())
	            {
	                Flight flight = new Flight();
	                flight.setId(resultSet.getInt("flight_id"));
	                flight.setSource(resultSet.getString("sourceOfFlight"));
	                flight.setDestination(resultSet.getString("destination"));
	                flight.setAirline(resultSet.getString("airline"));
	                flight.setTicketPrice(resultSet.getFloat("ticketPrice"));
	                flight.setDateOfFlight(resultSet.getDate("dateofflight"));
	                flight.setNumberOfSeatsLeft(resultSet.getInt("numberOfSeatsLeft"));
	                flights.add(flight);
	            }
	        } catch (Exception e) {
	            // TODO: handle exception
	        }
	        request.setAttribute("flights", flights);
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminHomePage.jsp");
	        requestDispatcher.forward(request, response);
	    }
}

