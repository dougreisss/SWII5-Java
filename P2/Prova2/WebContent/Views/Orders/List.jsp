<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <link rel="stylesheet" type="text/css" href="../CSS/style.css">
                <meta charset="UTF-8">
                <title>Order</title>
            </head>

            <body>
                <div class="container">
                    <header>
                        <h1>Order</h1>
                    </header>

                    <nav class="link-group">
                        <a href="/Prova2/Customer/new" class="nav-link">Add New Customer</a>
                        <a href="/Prova2/Customer/list" class="nav-link">List All Customer</a>
                        <a href="/Prova2/Salesman/new" class="nav-link">Add New Salesman</a>
                        <a href="/Prova2/Salesman/list" class="nav-link">List All Salesman</a>
                        <a href="/Prova2/Order/new" class="nav-link">Add New Order</a>
                        <a href="/Prova2/Order/list" class="nav-link">List All Order</a>
                    </nav>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Order No</th>
                                <th>Order Purch Amt</th>
                                <th>Order Date</th>
                                <th>Order Customer ID</th>
                                <th>Order Salesman ID</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${list.size() > 0}">
                                <c:forEach var="order" items="${list}">
                                    <tr>
                                        <td>
                                            <c:out value="${order.getOrdNo()}" />
                                        </td>
                                        <td>
                                            <c:out value="${order.getPurchAmt()}" />
                                        </td>
                                        <td>
 											<fmt:formatDate value="${order.getOrdDate()}" pattern="dd/MM/yyyy" />  
                                		</td>
                                        <td>
                                            <c:out value="${order.getCustomerId()}" />
                                        </td>
                                        <td>
                                            <c:out value="${order.getSalesmanId()}" />
                                        </td>
                                        <td>
                                            <a
                                                href="/Prova2/Order/edit?id=<c:out value='${order.getOrdNo()}'/>">Edit</a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <a
                                                href="/Prova2/Order/delete?id=<c:out value='${order.getOrdNo()}'/>">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            <c:if test="${list.size() <= 0}">
                                <tr>
                                    <td colspan="6">No records found!</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </body>

            </html>