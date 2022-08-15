<%-- 
    Document   : search
    Created on : Mar 20, 2022, 3:03:20 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row content py-3">
    <div class="col-sm-3">
        <div class="card-header text-dark text-uppercase" style="font-weight: bold;">Price</div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="check1" name="option1" value="something" checked>
            <label class="form-check-label">< 50 $</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="check1" name="option1" value="something" checked>
            <label class="form-check-label">50 $ - 100 $</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="check1" name="option1" value="something" checked>
            <label class="form-check-label">100 $ - 200 $</label>
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