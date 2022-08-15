<%-- 
    Document   : confirm
    Created on : Mar 22, 2022, 12:19:15 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row page-header">
    <div class="col">
        Shopping Confirmation
    </div>
</div>
<div class="row page-body mb-3">
    <div class="col">
            <br/>
            <h5>Do you want to buy this ?</h5>
            <br/>
            <a href="<c:url value="/shopping/information.do"/>" class="btn btn-outline-success"><i class="bi bi-check-circle"></i> Yes</a>
            <a href="<c:url value="/cart/index.do"/>" class="btn btn-outline-danger"><i class="bi bi-x-circle"></i> No</a>
        <div style="font-style: italic; color: red">${errorMessage}</div>
    </div>
</div>
