<%-- 
    Document   : index
    Created on : Mar 17, 2022, 12:42:36 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<c:url value="/images/slide4.jpg"/>" alt="Los Angeles" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/images/slide2.jpg"/>" alt="Chicago" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/images/slide3.jpg"/>" alt="New York" class="d-block w-100">
    </div>
  </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>


<div class="row content py-3">
    <div class="col-sm-3">
        <div class="card bg-light mb-5">
            <div class="card-header bg-dark text-white text-uppercase" style="font-weight: bold;"><i class="fa fa-list"></i> Categories</div>
            <ul class="list-group category_block">
                <c:forEach items="${listc}" var="o">
                    <form action="<c:url value="/category/index.do"/>">
                        <input type="hidden" value="${o.id}" name="category_id"/>
                        <li class="list-group-item text-white"><button class="btn" type="submit">${o.name}</button></li>
                    </form>
                </c:forEach>

            </ul>
        </div>
        <div class="card bg-light mb-3">
            <div class="card-header bg-dark text-white text-uppercase p-2 text-center" style="font-weight: bold;">New product</div>
            <div class="card-body">
                <c:forEach var="p" items="${last}">
                    <div class="p-2">            
                        <img class="img-fluid" src="<c:url value="/products/${p.id}.jpg"/>" width="100%"/>
                        <div class="text-center">${p.description}</div><br>
                        <!--type="currency"-->
                        <!--pattern="$ #,##0.00"-->
                        <strike style="color:red;"><fmt:formatNumber value="${p.price}"  pattern="$ #,##0.00" /></strike>
                        <span style="color:orange;font-size:30px;font-weight: bold;text-shadow: 2px 2px red"><fmt:formatNumber value="${p.price * (1-p.discount)}" pattern="$ #,##0.00" /></span><br> 
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="col-sm-9">    
        <div class="row">
            <c:forEach var="product" items="${list}">
                <div class="col-sm-4 p-2">  
                    <form action="<c:url value="/detail/index.do"/>">             
                        <img src="<c:url value="/products/${product.id}.jpg"/>" width="100%"/>
                        <input type="hidden" value="${product.id}" name="id"/>
                        <b>${product.description}</b><br>
                        <b>Discount:</b> <span style="color:red;font-size:20px;font-weight: bold;font-style: italic;"><fmt:formatNumber value="${product.discount==0?null:product.discount}" type="percent" /></span><br>
                        <!--type="currency"-->
                        <!--pattern="$ #,##0.00"-->
                        <strike style="color:red;"><fmt:formatNumber value="${product.price}"  pattern="$ #,##0.00" /></strike>
                        <span style="color:orange;font-size:20px;font-weight: bold;text-shadow: 2px 2px blue"><fmt:formatNumber value="${product.price * (1-product.discount)}" pattern="$ #,##0.00" /></span><br> 
                        <button type="submit" class="btn btn-outline-danger " style="margin-left: 80px;">Buy Now</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="row">
    <div class="col" style="text-align: right;">
        <br/>
        <form action="<c:url value="/home/index.do" />">
            <button type="submit" class="btn btn-sm btn-dark" name="op" value="FirstPage" title="First Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-bar-left"></i></button>
            <button type="submit" class="btn btn-sm btn-dark" name="op" value="PreviousPage" title="Previous Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-left"></i></button>
            <button type="submit" class="btn btn-sm btn-dark" name="op" value="NextPage" title="Next Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-right"></i></button>
            <button type="submit" class="btn btn-sm btn-dark" name="op" value="LastPage" title="Last Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-bar-right"></i></button>
            <input type="text" name="gotoPage" value="${page}" class="btn btn-sm btn-outline-default" style="text-align: right;width: 32px;" title="Enter page number"/>
            <button type="submit" class="btn btn-sm btn-dark" name="op" value="GotoPage" title="Goto Page"><i class="bi bi-arrow-up-right-circle"></i></button>
        </form>
        Page ${page}/${totalPage}
    </div>
</div>