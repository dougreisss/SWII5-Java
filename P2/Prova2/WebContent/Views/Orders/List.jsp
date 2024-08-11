<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Order</title>
            </head>

            <body>
                <center>
                    <h1>Order</h1>
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
                            <th>Order No</th>
                            <th>Order Purch Amt</th>
                            <th>Order Date</th>
                            <th>Order Customer ID</th>
                            <th>Order Salesman ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${list.size() > 0}">
                            <c:forEach var="ordem" items="${list}">
                                <tr>
                                    <td>
                                        <c:out value="${ordem.getOrdNo()}" />
                                    </td>
                                    <td>
                                        <c:out value="${ordem.getPurchAmt()}" />
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${ordem.getOrdDate()}" pattern="dd/MM/yyyy" />
                                    </td>
                                    <td>
                                        <c:out value="${ordem.getCustomerId()}" />
                                    </td>
                                    <td>
                                        <c:out value="${ordem.getSalesmanId()}" />
                                    </td>
                                    <td>
                                        <a
                                            href="/Prova2/Order/edit?id=<c:out value='${item.getSalesmanId()}'/>">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a
                                            href="/Prova2/Order/delete?id=<c:out value='${item.getSalesmanId()}'/>">Delete</a>
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

            </body>

            </html>