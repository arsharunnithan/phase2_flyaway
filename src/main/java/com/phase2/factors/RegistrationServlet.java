package com.phase2.factors;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the flight details from the session attributes
	        String flight_id = (String) request.getSession().getAttribute("flight_id");
	        String dateofflight = (String) request.getSession().getAttribute("departureDate");
	        int numberOfSeatsLeft = (int) request.getSession().getAttribute("numberOfSeatsLeft");
	        double ticketPrice = (double) request.getSession().getAttribute("ticketPrice");
	        
	        // Get the user information from the registration form
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String ssn = request.getParameter("socialSecurityNumber");
	        String address = request.getParameter("address");
	        String contact = request.getParameter("contact");
	        
	        User user = new User();
	        user.setName(request.getParameter("name"));
	        user.setEmail(request.getParameter("email"));
	        user.setSocialSecurityNumber(request.getParameter("socialSecurityNumber"));
	        user.setAddress(request.getParameter("address"));
	        user.setContact(request.getParameter("contact"));
	        request.getSession().setAttribute("user", user);

	        
	        // Set the flight details and user information as request attributes
	        request.setAttribute("flightNumber", flight_id);
	        request.setAttribute("departureDate", dateofflight);
	        request.setAttribute("numberOfSeatsLeft", numberOfSeatsLeft);
	        request.setAttribute("ticketPrice", ticketPrice);
	        request.setAttribute("name", name);
	        request.setAttribute("email", email);
	        request.setAttribute("ssn", ssn);
	        request.setAttribute("address", address);
	        request.setAttribute("contact", contact);
	        
	        // Forward the request to the displayDetails page
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/displayDetails.jsp");
	        dispatcher.forward(request, response);
	        
	    }

}
