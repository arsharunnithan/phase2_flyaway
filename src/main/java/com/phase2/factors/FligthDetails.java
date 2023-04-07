package com.phase2.factors;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FligthDetails
 */
@WebServlet("/FligthDetails")
public class FligthDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get the flight details from the request parameters
	    String flight_id = request.getParameter("flight_id");
	    String dateofflight = request.getParameter("dateofflight");
	    int numberOfSeatsLeft = Integer.parseInt(request.getParameter("numberOfSeatsLeft"));
	    double ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
	    
	    // Set the flight details as attributes in the request object
	    request.setAttribute("flightNumber", flight_id);
	    request.setAttribute("departureDate", dateofflight);
	    request.setAttribute("numberOfSeatsLeft", numberOfSeatsLeft);
	    request.setAttribute("ticketPrice", ticketPrice);

	    // Redirect the user to registration.jsp
	    request.getRequestDispatcher("registration.jsp").forward(request, response);
	    System.out.println(flight_id+dateofflight+numberOfSeatsLeft+ticketPrice);

	}

}
