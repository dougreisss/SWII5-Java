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

                <div class="form-container">
                    <c:choose>
                        <c:when test="${customer != null}">
                            <form action="update" method="post">
                        </c:when>
                        <c:otherwise>
                            <form action="insert" method="post">
                        </c:otherwise>
                    </c:choose>

                    <table class="form-table">
                        <caption class="form-caption">
                            <h2>
                                <c:choose>
                                    <c:when test="${customer != null}">Edit Customer</c:when>
                                    <c:otherwise>Add New Customer</c:otherwise>
                                </c:choose>
                            </h2>
                        </caption>

                        <c:if test="${customer != null}">
                            <input type="hidden" id="id" name="id"
                                value="<c:out value='${customer.getCustomerId()}' />" />
                        </c:if>
                        <tr>
                            <th><label for="name">Customer Name:</label></th>
                            <td><input type="text" id="name" name="name"
                                    value="<c:out value='${customer.getCustName()}' />" /></td>
                        </tr>
                        <tr>
                            <th><label for="city">Customer City:</label></th>
                            <td><input type="text" id="city" name="city"
                                    value="<c:out value='${customer.getCity()}' />" /></td>
                        </tr>
                        <tr>
                            <th><label for="grade">Customer Grade:</label></th>
                            <td><input type="text" id="grade" name="grade"
                                    value="<c:out value='${customer.getGrade()}' />" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="form-submit">
                                <input type="submit" value="Save" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>

        </body>

        </html>