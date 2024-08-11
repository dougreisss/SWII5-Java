<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<center>
		     <h1>Customer</h1>
		     <h2>
		         <a href="/Prova2/Customer/new">Add New Customer</a>
		         &nbsp;&nbsp;&nbsp;
		         <a href="/Prova2/Customer/list">List All Customer</a>
		         &nbsp;&nbsp;&nbsp;
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
								<c:out value="${item.customerId}"/>
							<td>
								<c:out value="${item.custName}" />
							</td>
		                 	<td>
		                 		<c:out value="${item.city}" />
		                 	</td>
		                 	<td>
		                 		<c:out value="${item.grade}" />
	                 		</td>
		                 	<td>
		                 		<c:out value="${item.salesmanId}" />
	                 		</td>
	                 		<td>
	                 			<a href="/Prova2/Customer/edit?id=<c:out value='${item.customerId}'/>">Edit</a>
	                 		    &nbsp;&nbsp;&nbsp;&nbsp;
            				    <a href="/Prova2/Customer/delete?id=<c:out value='${item.customerId}'/>">Delete</a>                     
	                 		</td>
						</tr>
					</c:forEach>
	            </c:if>
			</tbody>
		</table>
	</body>
</html>