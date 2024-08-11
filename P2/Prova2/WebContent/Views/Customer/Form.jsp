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

            <div align="center">
                <c:if test="${customer != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${customer == null}">
                    <form action="insert" method="post">
                </c:if>
                <table border="1" cellpadding="5">
                    <caption>
                        <h2>
                            <c:if test="${customer != null}">
                                Edit Customer
                            </c:if>
                            <c:if test="${customer == null}">
                                Add New Customer
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${customer != null}">
                        <input type="hidden" id="id" name="id" value="<c:out value='${customer.getCustomerId()}' />" />
                    </c:if>
                    <tr>
                        <th>Customer Name: </th>
                        <td>
                            <input type="text" id="name" name="name" value="<c:out value='${customer.getCustName()}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer City: </th>
                        <td>
                            <input type="text" id="city" name="city" value="<c:out value='${customer.getCity()}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer Grade: </th>
                        <td>
                            <input type="text" id="grade" name="grade" value="<c:out value='${customer.getGrade()}' />" />
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