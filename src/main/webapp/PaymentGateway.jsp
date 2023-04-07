<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Gateway</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="number"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        a {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
     <form autocomplete="off">
        <h2>Payment Gateway</h2>
        <label for="cardnumber">Card Number</label>
        <input type="text" id="cardnumber" name="cardnumber" placeholder="Enter your card number..." required="required">

        <label for="expirydate">Expiry Date</label>
        <input type="date" id="expirydate" name="expirydate" placeholder="Enter the expiry date..." required="required">

        <label for="cvv">CVV</label>
        <input type="text" id="cvv" name="cvv" placeholder="Enter your CVV..." required="required">

        <label for="name">Name on Card</label>
        <input type="text" id="name" name="name" placeholder="Enter your name..." required="required">

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="Enter your email address..." required="required">

		<label for="amount">Amount</label>
		<input type="text" id="amount" name="amount" placeholder="Enter the amount..." value="<%= request.getAttribute("ticketPrice") %>">



        <a href="PaymentComplete.jsp">Pay Now</a>
    </form>
</body>
</html>
