<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
	}
	
	/* Style for the header */
	section {
		height: 33.33%;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		text-align: center;
		border: 1px solid black;
		padding: 10px 20px;
		
	}
	
	h1 {
	  font-size: 48px;
	  color: #333;
	  margin: 0;
	  padding: 20px 0;
	  border-bottom: 1px solid #ddd;
	}
	
	h1:first-of-type {
		background-color: #4CAF50;
	}
	
	h1:last-of-type {
		background-color: white;
		border: 0;
	}
	
	/* Style for the links */
	a {
	  background-color: #4CAF50;
	  color: white;
	  padding: 10px 20px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  border-radius: 5px;
	}

	/* Style for the list headers */
	h3.list {
	  font-size: 24px;
	  color: #333;
	  margin-top: 40px;
	  display: flex;
	}

	/* Style for the list items */
	ul {
	  list-style: none;
	  margin: 0;
	  padding: 0;
	}

	li {
	  font-size: 16px;
	  color: #666;
	  margin-bottom: 10px;
	}

	/* Style for the flight table */
	table {
	  border-collapse: collapse;
	  width: 100%;
	}

	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}

	th {
	  background-color: #f2f2f2;
	}

	/* Style for the airline list */
	.airline-list {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: space-between;
	}

	.airline-list li {
	  font-size: 16px;
	  color: #666;
	  width: 30%;
	  margin-bottom: 20px;
	  padding: 10px;
	  border: 1px solid #ddd;
	  border-radius: 5px;
	  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}
</style>
</head>
<body>
<a href="forgotPassword.jsp">Change Password</a>
<a href="index.jsp" style="position: absolute; top: 0px; right: 10px;">Logout</a>
	<section>
  <h1>Source-Destination List</h1>
  <a href="sourceDestination">Click here</a>
  <div style="display: flex;">
    <div style="margin-right: 20px;">
      <h3>Source List</h3>
      <ul>
        <c:forEach var="source" items="${sourceList}">
          <li>${source}</li>
        </c:forEach>
      </ul>
    </div>
    <div style="margin-left: 20px;">
      <h3>Destination List</h3>
      <ul>
        <c:forEach var="destination" items="${destinationList}">
          <li>${destination}</li>
        </c:forEach>
      </ul>
    </div>
  </div>
</section>


	
	<section>
    <h1>Flight List</h1>
    <a href="flightsListServlet">Click here</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Date of Flight</th>
            <th>Number of Seats Left</th>
            <th>Ticket Price</th>
            <th>Airline</th>
        </tr>
        <c:forEach var="flight" items="${flights}">
            <tr>
                <td>${flight.id}</td>
                <td>${flight.source}</td>
                <td>${flight.destination}</td>
                <td>${flight.dateOfFlight}</td>
                <td>${flight.numberOfSeatsLeft}</td>
                <td>${flight.ticketPrice}</td>
                <td>${flight.airline}</td>
            </tr>
        </c:forEach>
    </table>
</section>

   	<section> 
		<h1>AirLine List</h1>
		<a href="AirlineServlet">Click here</a>
		<ul>
        	<c:forEach var="airline" items="${airline}">
            	<li>${airline}</li>
        	</c:forEach>
    	</ul>
    </section>	
</body>
</html>