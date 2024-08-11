<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Salesman</title>
        </head>

        <body>
            <center>
                <h1>Salesman</h1>
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
                <c:if test="${salesman != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${salesman == null}">
                    <form action="insert" method="post">
                </c:if>
                <table border="1" cellpadding="5">
                    <caption>
                        <h2>
                            <c:if test="${salesman != null}">
                                Edit Salesman
                            </c:if>
                            <c:if test="${salesman == null}">
                                Add New Salesman
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${salesman != null}">
                        <input type="hidden" id="id" name="id" value="<c:out value='${salesman.getSalesmanId()}' />" />
                    </c:if>
                    <tr>
                        <th>Salesman Name: </th>
                        <td>
                            <input type="text" id="name" name="name" value="<c:out value='${salesman.getName()}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Salesman City: </th>
                        <td>
                            <input type="text" id="city" name="city" value="<c:out value='${salesman.getCity()}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Commission: </th>
                        <td>
                            <input type="text" id="commission" name="commission"
                                value="<c:out value='${salesman.getCommission()}' />" />
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