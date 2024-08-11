<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link rel="stylesheet" type="text/css" href="../CSS/style.css">
            <meta charset="UTF-8">
            <title>Salesman</title>
        </head>

        <body>
            <div class="container">
                <header>
                    <h1>Salesman</h1>
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
                            <th>Salesman ID</th>
                            <th>Salesman Name</th>
                            <th>Salesman City</th>
                            <th>Salesman Commission</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${list.size() > 0}">
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td>
                                        <c:out value="${item.getSalesmanId()}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.getName()}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.getCity()}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.getCommission()}" />
                                    </td>
                                    <td>
                                        <a
                                            href="/Prova2/Salesman/edit?id=<c:out value='${item.getSalesmanId()}'/>">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a
                                            href="/Prova2/Salesman/delete?id=<c:out value='${item.getSalesmanId()}'/>">Delete</a>
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
            </div>
        </body>

        </html>