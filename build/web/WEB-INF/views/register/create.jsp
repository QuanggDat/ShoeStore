<%-- 
    Document   : create
    Created on : Mar 22, 2022, 1:08:37 AM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Create Account</h2>
<a href="<c:url value="/login.jsp"/>" class="btn btn-outline-warning">Login</a>
<hr>
<div class="row mb-5">
    <div class="col">
        <form action="save.do">
            <div class="mb-3 mt-3">
                <label for="gmail" class="form-label">Gmail:</label>
                <input type="text" class="form-control" id="gmail" placeholder="Enter gmail" name="gmail">
            </div>
            <div class="mb-3">
                <label for="fullName" class="form-label">Name:</label>
                <input type="text" class="form-control" id="fullName" placeholder="Enter name" name="fullName">
            </div>
            <div class="mb-3">
                <input type="hidden" value="US" name="roleID">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" placeholder="Password" name="password">
            </div>
            <button type="submit" class="btn btn-sm btn-outline-success" name="op" value="save">Save <i class="bi bi-download"></i></button>
        </form>
        <div class="text-danger" style="font-style: italic;">${error}</div>
        <div class="text-danger" style="font-style: italic;">${errorMessage}</div>
        <div class="text-success" style="font-style: italic;">${SUCCESS}</div>
    </div>
    <div class="col">

    </div>
</div>

