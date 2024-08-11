<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" type="text/css" href="../CSS/style.css">
            <meta charset="UTF-8">
            <title>Customer</title>
        </head>

        <body>
            <div class="container">
                <header>
                    <h1>Customer</h1>
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
                            <th>Customer Id</th>
                            <th>Customer Name</th>
                            <th>Customer City</th>
                            <th>Customer Grade</th>
                            <th>Customer Salesman Id</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${list.size() > 0}">
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td>
                                        <c:out value="${item.getCustomerId()}" />
                                    </td>
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
                                        <a
                                            href="/Prova2/Customer/edit?id=<c:out value='${item.getCustomerId()}'/>">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a
                                            href="/Prova2/Customer/delete?id=<c:out value='${item.getCustomerId()}'/>">Delete</a>
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