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
                <div align="center">
                    <c:if test="${order != null}">
                        <form action="update" method="post">
                    </c:if>
                    <c:if test="${order == null}">
                        <form action="insert" method="post">
                    </c:if>
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${order != null}">
                                    Edit Order
                                </c:if>
                                <c:if test="${order == null}">
                                    Add New Order
                                </c:if>
                            </h2>
                        </caption>
                        <c:if test="${customer != null}">
                            <input type="hidden" id="id" name="id" value="<c:out value='${order.getOrdNo()}' />" />
                        </c:if>
                        <tr>
                            <th>Purch Amt: </th>
                            <td>
                                <input type="text" id="purchAmt" name="nome"
                                    value="<c:out value='${order.getPurchAmt()}' />" />
                            </td>
                        </tr>
                        <tr>
                            <th>Date: </th>
                            <td>
                               <input type="text" id="ordDate" name="ordDate" value="<fmt:formatDate value="${order.getOrdDate()}" pattern="dd/MM/yyyy" />" />
                            </td>
                        </tr>
                        <tr>
                            <th>Customer ID: </th>
                            <td>
                                <input type="text" id="customerId" name="customerId"
                                    value="<c:out value='${order.getCustomerId()}' />" />
                            </td>
                        </tr>
                        <tr>
                            <th>Salesman Id: </th>
                            <td>
                                <input type="text" id="salesmanId" name="salesmanId"
                                    value="<c:out value='${order.getSalesmanId()}' />" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Save" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </body>

            </html>