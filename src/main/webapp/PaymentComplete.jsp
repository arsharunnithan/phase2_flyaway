<%@page import="com.phase2.factors.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
/* Get the flight details from the session object */
String flight_id = (String) session.getAttribute("flight_id");
String dateofflight = (String) session.getAttribute("dateofflight");
int numberOfSeatsLeft = (Integer) session.getAttribute("numberOfSeatsLeft");
double ticketPrice = (Double) session.getAttribute("ticketPrice");
%>
<%
User user = (User) request.getSession().getAttribute("user");
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
        <td><%= user.getName() %></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><%= user.getEmail() %></td>
    </tr>
    <tr>
        <th>Social Security Number</th>
        <td><%= user.getSocialSecurityNumber() %></td>
    </tr>
    <tr>
        <th>Address</th>
        <td><%= user.getAddress() %></td>
    </tr>
    <tr>
        <th>Contact</th>
        <td><%= user.getContact() %></td>
    </tr>
	</table>
 	<a href="index.jsp">
 	Payment Done <br>
 	Please note : Personal details regarding only the Registered person is accepted as of now
 	</a>
</body>
</html>