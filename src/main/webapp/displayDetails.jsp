<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
/* Get the flight details from the session object */
String flight_id = (String) session.getAttribute("flight_id");
String dateofflight = (String) session.getAttribute("dateofflight");
int numberOfSeatsLeft = (Integer) session.getAttribute("numberOfSeatsLeft");
double ticketPrice = (Double) session.getAttribute("ticketPrice");

/* Get the customer details from the session object */
String name = (String) request.getAttribute("name");
String email = (String) request.getAttribute("email");
String ssn = (String) request.getAttribute("ssn");
String address = (String) request.getAttribute("address");
String contact = (String) request.getAttribute("contact");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Flight Details</title>
	<style>
		table {
		  font-family: Arial, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		  margin: 0 auto;
		}

		td, th {
		  border: 1px solid #ddd;
		  padding: 8px;
		  text-align: center;
		}
		h2 {
    font-size: 50px;
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
    color: #4CAF50;
}

		th {
		  
		  background-color: #f2f2f2;
		}
		a {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  border-radius: 5px;
  display: table;
  margin: 0 auto;
  margin-top: 20px;
}



	</style>
</head>
<body>
	<h2>Flight Details</h2>
	<table>
		<tr>
			<th>Flight Number</th>
			<td><%= flight_id %></td>
		</tr>
		<tr>
			<th>Departure Date</th>
			<td><%= dateofflight %></td>
		</tr>
		<tr>
			<th>Number of Seats Left</th>
			<td><%= numberOfSeatsLeft %></td>
		</tr>
		<tr>
			<th>Ticket Price</th>
			<td><%= ticketPrice %></td>
		</tr>
	</table>	
		<h2>Customer Details</h2>
	<table>	
		<tr>
			<th>Name</th>
			<td><%= name %></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%= email %></td>
		</tr>
		<tr>
			<th>Social Security Number</th>
			<td><%= ssn %></td>
		</tr>
		<tr>
			<th>Address</th>
			<td><%= address %></td>
		</tr>
		<tr>
			<th>Contact</th>
			<td><%= contact %></td>
		</tr>
	</table>
	<a href="PaymentGateway">Book Flight</a>

</body>
</html>
