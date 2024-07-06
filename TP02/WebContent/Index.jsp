<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/GetProductsServlet" var="LstProducts" />
<c:url value="/AddProductServlet" var="AddProducts" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Products Page</title>
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
			<p>Developed by Douglas Reis e Lucas Aquino</p>
		</main>
		<footer>IFSP CUBATÃO - 2024</footer>
	</body>
</html>