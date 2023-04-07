<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Flights</title>
<style type="text/css">
table {
  font-family: Arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin: 0 auto;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

th {
  background-color: #dddddd;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

a {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 5px;
}
h2 {
    font-size: 50px;
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
    color: #4CAF50;
}
#select-flight {
    font-size: 20px;
    margin-bottom: 10px;
    text-align: center;
    color: coral;
}

</style> 
</head>
<body>
	<h2>Available Flights</h2>
	<div id="select-flight">Let us pick your flight!!</div>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Date of Flight</th>
				<th>Number of Seats Left</th>
				<th>Ticket Price</th>
				<th>Register</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="flight" items="${flights}">
				<tr>
					<td>${flight.id}</td>
					<td>${flight.source}</td>
					<td>${flight.destination}</td>
					<td>${flight.dateOfFlight}</td>
					<td>${flight.numberOfSeatsLeft}</td>
					<td>${flight.ticketPrice}</td>
					<td><a href="FligthDetails?flight_id=${flight.id}&dateofflight=${flight.dateOfFlight}&numberOfSeatsLeft=${flight.numberOfSeatsLeft}&ticketPrice=${flight.ticketPrice}"class="register-link">Select</a></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
