<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                    <a href="/Prova2//Customer/list">List All Customer</a>
                    &nbsp;&nbsp;&nbsp;
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
                            <c:if test="${book != null}">
                                Edit Book
                            </c:if>
                            <c:if test="${book == null}">
                                Add New Book
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${customer != null}">
                        <input type="hidden" id="id" name="id" value="<c:out value='${customer.customerId}' />" />
                    </c:if>
                    <tr>
                        <th>Customer Name: </th>
                        <td>
                            <input type="text" id="name" name="nome" value="<c:out value='${customer.custName}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer City: </th>
                        <td>
                            <input type="text" id="city" name="cidade" value="<c:out value='${customer.city}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Customer Grade: </th>
                        <td>
                            <input type="text" id="grade" name="grade" value="<c:out value='${customer.grade}' />" />
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