<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:url value="/GetProductsServlet" var="LstProducts" />
<c:url value="/AddProductServlet" var="AddProducts" />
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>New Product</title>
	</head>
	<body>
		<header>
			<nav>
				<div>
					<a href="Index.jsp">Home</a>
					<br />
					<a href="${ LstProducts }">Get all products</a>
					<br />
					<a href="${ AddProducts }">Add Product</a>
					<br />
					<a href="Credits.jsp">Credits</a>
				</div>
			</nav>
		</header>
		
		<main>
		    <form action="${AddProducts}" method="post">
		        <table>
		            <tr>
		                <td>Name:</td>
		                <td><input type="text" name="Name" value=""></td>
		            </tr>
		            <tr>
		                <td>Unit Purchase:</td>
		                <td><input type="number" name="UnitPurchase" value=""></td>
		            </tr>
		            <tr>
		                <td>Description:</td>
		                <td><input type="text" name="Description" value=""></td>
		            </tr>
		            <tr>
		                <td>Qty Expected Month:</td>
		                <td><input type="number" name="QtyExpectedMonth" step="0.01" value=""></td>
		            </tr>
		            <tr>
		                <td>Max Price Purchased:</td>
		                <td><input type="number" step="0.01" name="MaxPricePurchased" value=""></td>
		            </tr>
		        </table>
	        	<button type="submit">Add new product</button>
    		</form>
		</main>
		
		<footer>
			<p>Douglas Reis e Lucas Aquino</p>
		</footer>
	</body>
</html>