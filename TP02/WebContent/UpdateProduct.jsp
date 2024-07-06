<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<c:url value="/GetProductsServlet" var="LstProducts" />
<c:url value="/AddProductServlet" var="AddProducts" />
<c:url value="/UpdateProductServlet" var="UpdateProducts" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Product</title>
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
		
		<br/>
		
		<main>
			<form action="${UpdateProducts}" method="post">
		        <table>
		        	<tr>
		        		<td>Id: </td>
		        		<td><input readonly type="text" name="id" value="${ product.id }" /></td>
		        	</tr>
		            <tr>
		                <td>Name:</td>
		                <td><input type="text" name="Name" value="${ product.name }"></td>
		            </tr>
		            <tr>
		                <td>Unit Purchase:</td>
		                <td><input type="number" name="UnitPurchase" value="${ product.unitPurchase }"></td>
		            </tr>
		            <tr>
		                <td>Description:</td>
		                <td><input type="text" name="Description" value="${ product.description }"></td>
		            </tr>
		            <tr>
		                <td>Qty Expected Month:</td>
		                <td><input type="number" name="QtyExpectedMonth" step="0.01" value="${ product.qtyExpectedMonth }"></td>
		            </tr>
		            <tr>
		                <td>Max Price Purchased:</td>
		                <td><input type="number" step="0.01" name="MaxPricePurchased" value="${ product.maxPricePurchased }"></td>
		            </tr>
		        </table>
		        
		        <br/>
		        
	        	<button type="submit">Update Product</button>
    		</form>
		</main>
		
		<footer>
			<p>Developed by Douglas Reis e Lucas Aquino</p>
		</footer>
	</body>
</html>