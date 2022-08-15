<%-- 
    Document   : main
    Created on : Mar 3, 2022, 10:21:14 AM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ShoesStore</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>        
        <link href="${root}/css/site.css" rel="stylesheet" type="text/css"/>
        <link href="${root}/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="ftco-section">
            <div class="container-fluid px-md-5">
                <div class="row justify-content-between">
                    <div class="col-md-8 order-md-last">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <a class="navbar-brand" href="${root}/home/index.do">hqhshoes<span>Assignment - Prj</span></a>
                            </div>
                            <div class="col-md-6 d-md-flex justify-content-end mb-md-0 mb-3">
                                <form action="<c:url value="/search/index.do"/>" class="searchform order-lg-last">
                                    <div class="form-group d-flex">
                                        <input type="text" class="form-control pl-3" placeholder="Search" name="searchText" value="">
                                        <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex">
                        <div class="social-media">
                            <p class="mb-0 d-flex">
                                <a href="https://www.facebook.com/" target="blank" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
                                <a href="https://www.instagram.com/" target="blank" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container-fluid">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="fa fa-bars"></span> Menu
                    </button>
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav m-auto">
                            <li class="nav-item active"><a href="${root}/home/index.do" class="nav-link">Home</a></li>
                            <li class="nav-item"><a href="https://www.facebook.com/" class="nav-link">Page</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Work</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->

        </section>
        <div class="container">
            <!--navigator-->     
            <div class="row">
                <div class="col">
                    <div class="header">
                        <div class="header-link">
                            <c:if test="${login_user.roleID}">
                                <a href="#" class="btn btn-light"><i class="bi bi-person-dash-fill"></i> Logout</a> | 
                            </c:if>
                            <c:if test="${user == null}">
                                <a href="${root}" class="btn btn-light"><i class="bi bi-person-dash-fill"></i> Logout</a> | 
                                <a href="${root}/register/create.do" class="btn btn-light"><i class="bi bi-person-plus-fill"></i> Register</a> | 
                            </c:if>
                            <c:if test="${user != null}">                            
                                <i class="bi bi-person-check"></i> Welcome ${user.name} | 
                                <a href="#" class="btn btn-light"><i class="bi bi-box-arrow-left"></i> Logout</a> | 
                            </c:if>
                            <a href="<c:url value="/cart/index.do"/>" class="btn btn-dark"><i class="bi bi-cart-fill"></i> ${cart==null?0:cart.numOfProducts}</a>
                        </div>
                    </div>
                    <hr/>
                </div>
            </div>                   
            <!--body-->
            <div class="col">                    
                <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
            </div>
            <!--end body-->

            <!--footer-->
        </div>  
        <!-- Site footer -->
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>About</h6>
                        My Assignment project is a try hard of 5 members : Hoa, Lau, Long, Dat, Cong
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Categories</h6>
                        <ul class="footer-links">
                            <li><a href="#">NIKE</a></li>
                            <li><a href="#">ADIDAS</a></li>
                            <li><a href="#">PUMA</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Quick Links</h6>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Contribute</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by 
                            <a href="https://www.facebook.com/">HoangQuangHoa</a>.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
