<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Customer</title>
		</head>

		<body>
			<center>
				<h1>Customer</h1>
				<h2>
					<a href="/Prova2/Customer/new">Add New Customer</a>
					<br>
					<a href="/Prova2/Customer/list">List All Customer</a>
					<br>
					<a href="/Prova2/Salesman/new">Add New Salesman</a>
					<br>
					<a href="/Prova2/Salesman/list">List All Salesman</a>
					<br>
					<a href="/Prova2/Order/new">Add New Order</a>
					<br>
					<a href="/Prova2/Order/list">List All Order</a>
					<br>
				</h2>
			</center>
			<table>
				<thead>
					<tr>
						<th>Customer Id</th>
						<th>Customer Name</th>
						<th>Customer City</th>
						<th>Customer Grade</th>
						<th>Customer Salesman Id</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() > 0}">
						<c:forEach var="item" items="${list}">
							<tr>
								<td>
									<c:out value="${item.getCustomerId()}" />
								<td>
									<c:out value="${item.getCustName()}" />
								</td>
								<td>
									<c:out value="${item.getCity()}" />
								</td>
								<td>
									<c:out value="${item.getGrade()}" />
								</td>
								<td>
									<c:out value="${item.getSalesmanId()}" />
								</td>
								<td>
									<a href="/Prova2/Customer/edit?id=<c:out value='${item.getCustomerId()}'/>">Edit</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a
										href="/Prova2/Customer/delete?id=<c:out value='${item.getCustomerId()}'/>">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${list.size() <= 0}">
						<tr>
							<td colspan="5">No records found!</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</body>

		</html>