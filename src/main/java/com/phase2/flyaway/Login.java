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
import javax.servlet.http.HttpSession;

import com.phase2.factors.Flight;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = null;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customerDate = request.getParameter("date");
		String customerSource = request.getParameter("source");
		String customerDestination = request.getParameter("destination");
		String customerNumber = request.getParameter("numberOfPeople");
		//HttpSession session = request.getSession();
		RequestDispatcher requestDispatcher = null;
		ResultSet resultSet = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway?useSSL=false","root","password");
			PreparedStatement preparedStatement = connection.prepareStatement("select * from flights where dateofflight = ? and sourceOfFlight = ? and destination = ? and numberOfSeatsLeft >= ?+1");
			
			preparedStatement.setString(1, customerDate);
			preparedStatement.setString(2, customerSource);
			preparedStatement.setString(3, customerDestination);
			preparedStatement.setString(4, customerNumber);
			
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
			    // create a List to store the flight objects
			    List<Flight> flights = new ArrayList<>();

			    // loop through the ResultSet and create Flight objects
			    do {
			        Flight flight = new Flight();
			        flight.setId(resultSet.getInt("flight_id"));
			        flight.setSource(resultSet.getString("sourceOfFlight"));
			        flight.setDestination(resultSet.getString("destination"));
			        flight.setNumberOfSeatsLeft(resultSet.getInt("numberOfSeatsLeft"));
			        flight.setDateOfFlight(resultSet.getDate("dateofflight"));
			        double ticketPrice = resultSet.getDouble("ticketPrice");
			        if (flight.getNumberOfSeatsLeft() >= Integer.parseInt(customerNumber)) {
			            ticketPrice *= Integer.parseInt(customerNumber);
			            flight.setTicketPrice(ticketPrice);
			            flights.add(flight);
			        	}
			        }while (resultSet.next());
			    // set the List of flights as an attribute of the request
			    request.setAttribute("flights", flights);

			    // forward the request to the JSP page
			    requestDispatcher = request.getRequestDispatcher("AvailableFlights.jsp");
			    requestDispatcher.forward(request, response);			    
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
