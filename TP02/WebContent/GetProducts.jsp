<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:url value="/GetProductsServlet" var="LstProducts" />
<c:url value="/AddProductServlet" var="AddProducts" />
<c:url value="/UpdateProductServlet" var="UpdateProducts" />
<c:url value="/DeleteProductServlet" var="DeleteProduct" />


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Get Products</title>
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
			<h2>List of products:</h2>
				
				
			<table>
			  <thead>
			    <tr>
			      <th>Name</th>
   			      <th>Unit Purchase</th>
			      <th>Description</th>
			      <th>Qty Expected Month</th>
			      <th>Max Price Purchased</th>
			      <th></th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
			  
				 <c:forEach items="${ products }" var="product">
					<tr>
						<td>${product.name}</td>
						<td>${product.unitPurchase}</td>
						<td>${product.description}</td>
						<td>${product.qtyExpectedMonth}</td>
						<td>${product.maxPricePurchased}</td>
						<td><a href="${ UpdateProducts }?id=${product.id}">Edit</a></td>
						<td><a href="${ DeleteProduct }?id=${product.id}">Remove</a></td>
					</tr>
				</c:forEach>
			  </tbody>
			</table>
	
		</main>
		
		<footer>
			<p>Developed by Douglas Reis e Lucas Aquino</p>
		</footer>
	</body>
</html>