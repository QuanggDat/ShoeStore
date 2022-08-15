<%-- 
    Document   : index
    Created on : Mar 3, 2022, 3:33:43 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-striped">
    <thead>
        <tr>
            <th class="text-right">No</th>
            <th class="text-right">Id</th>
            <th class="text-center">Products</th>
            <th class="text-center">Description</th>
            <th class="text-right">Old price</th>
            <th class="text-right">Discount</th>
            <th class="text-right">New Price</th>
            <th class="text-right">Quantity</th>
            <th class="text-right">Cost</th>
            <th class="text-left">Operations</th>
        </tr>
    </thead>
    <tbody>
    <a href="${root}/home/index.do" class="btn btn-dark"><i class="bi bi-house-door-fill"></i> Home</a>
    <c:forEach var="item" items="${cart.items}" varStatus="loop">
        <form>
            <tr>
                <td class="text-right">${loop.count}</td>
                <td class="text-right">${item.id}</td>
                <td class="text-center"><img src="<c:url value="/products/${item.id}.jpg"/>" height="60"/></td>
                <td class="text-center">${item.description}</td>
                <td class="text-right"><fmt:formatNumber value="${item.price}" pattern="$#,##0.00"/></td>
                <td class="text-right"><fmt:formatNumber value="${item.discount}" pattern="#%"/></td>
                <td class="text-right"><fmt:formatNumber value="${item.newPrice}" pattern="$#,##0.00"/></td>
                <td class="text-right"><input type="number" value="${item.quantity}" name="quantity" style="width: 60px;"/></td>
                <td class="text-right"><fmt:formatNumber value="${item.cost}" pattern="$#,##0.00"/></td>
                <td>
                    <input type="hidden" value="${item.id}" name="id" />
                    <button type="submit" class="btn btn-sm btn-outline-success" formaction="<c:url value="/cart/update.do"/>"><i class="bi bi-bookmark-check"></i></button> 
                    <button type="submit" class="btn btn-sm btn-outline-danger" formaction="<c:url value="/cart/delete.do"/>"><i class="bi bi-trash"></i></button>
                </td>
            </tr>
        </form>
    </c:forEach>
</tbody>
<tfoot>
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th>Total</th>
        <th class="text-right"> = <fmt:formatNumber value="${cart.total}" pattern="$#,##0.00"/></th>
        <th><a href="<c:url value="/cart/empty.do"/>" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i> Empty your cart</a></th>
    </tr>
    <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th><a href="<c:url value="/shopping/confirm.do"/>" class="btn btn-success">BUY PRODUCTS</a></th>
    </tr>
</tfoot>
</table>

