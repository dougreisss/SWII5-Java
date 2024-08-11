<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html>

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

                    <div class="form-container">
                        <c:choose>
                            <c:when test="${order != null}">
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
                                        <c:when test="${order != null}">Edit Order</c:when>
                                        <c:otherwise>Add New Order</c:otherwise>
                                    </c:choose>
                                </h2>
                            </caption>

                            <c:if test="${order != null}">
                                <input type="hidden" id="id" name="id" value="<c:out value='${order.getOrdNo()}' />" />
                            </c:if>
                            <tr>
                                <th><label for="purchAmt">Purch Amt:</label></th>
                                <td>
                                    <input type="text" id="purchAmt" name="purchAmt"
                                        value="<c:out value='${order.getPurchAmt()}' />" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="ordDate">Date:</label></th>
                                <td>
                                    <input type="text" id="ordDate" name="ordDate" value="<fmt:formatDate value="
                                        ${order.getOrdDate()}" pattern="dd/MM/yyyy" />" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="customerId">Customer ID:</label></th>
                                <td>
                                    <input type="text" id="customerId" name="customerId"
                                        value="<c:out value='${order.getCustomerId()}' />" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="salesmanId">Salesman Id:</label></th>
                                <td>
                                    <input type="text" id="salesmanId" name="salesmanId"
                                        value="<c:out value='${order.getSalesmanId()}' />" />
                                </td>
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