<%-- 
    Document   : login
    Created on : Mar 21, 2022, 10:50:42 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container mt-5">
    <div class="text-center">
        <form class="form-signin" action="login">
            <img class="mb-4" src="https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars.png" alt="The Creator" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <label for="gmail" class="sr-only">Email</label>
            <input type="text" name="gmail" id="gmail" class="form-control" placeholder="abc@gmail.com" required autofocus><br>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="************" required>
            <!--            <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>-->
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
            <br><br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            Are you have a account ? <a href="register/create.do">Register here</a>
            <p class="mt-5 mb-3 text-muted">© PRJ301-HQH</p>
        </form>
    </div>
</div>


