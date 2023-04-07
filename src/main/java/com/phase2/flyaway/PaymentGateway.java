package com.phase2.flyaway;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaymentGateway
 */
@WebServlet("/PaymentGateway")
public class PaymentGateway extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 double ticketPrice = (double) session.getAttribute("ticketPrice");
		// set ticket price as a request attribute
		 request.setAttribute("ticketPrice", ticketPrice);

		 // forward request to Payment Gateway JSP page
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/PaymentGateway.jsp");
		 dispatcher.forward(request, response);
		 System.out.println(ticketPrice);
	}
	
}
