<%-- 
    Document   : index
    Created on : Mar 20, 2022, 4:05:57 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row content py-3">
    <div class="col-sm-4">
            <img src="<c:url value="/products/${product.id}.jpg"/>" width="100%"/>    
    </div>
    <div class="col-sm-8">    
        <div class="row">
            <div class="col-sm-4 p-2">  
                    <form action="<c:url value="/cart/add.do"/>">    
                        <input type="hidden" value="${product.id}" name="id"/>
                        <b>${product.description}</b><br>
                        <b>Discount:</b> <span style="color:red;font-size:20px;font-weight: bold;font-style: italic;"><fmt:formatNumber value="${product.discount==0?null:product.discount}" type="percent" /></span><br>
                        <!--type="currency"-->
                        <!--pattern="$ #,##0.00"-->
                        <strike style="color:red;"><fmt:formatNumber value="${product.price}"  pattern="$ #,##0.00" /></strike>
                        <span style="color:orange;font-size:20px;font-weight: bold;text-shadow: 2px 2px blue"><fmt:formatNumber value="${product.price * (1-product.discount)}" pattern="$ #,##0.00" /></span><br> 
                        <b>Quantity:</b> <input type="number" value="1" class="mb-3 " name="quantity" style="width: 80px;"/><br>
                        <button type="submit" class="btn btn-outline-danger " style="margin-left: 0px;"><i class="bi bi-cart-plus"></i></button>
                    </form>
                </div>
        </div>
    </div>
</div>
