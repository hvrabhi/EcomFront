<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Product list</title>
<link href="<c:url value="/resources/css/itempage.css" />"
	rel="stylesheet">
	


<script type="text/javascript">
$(document).ready(function(){
    $("#mycategory").click(function(){
        $("#myproduct").hide();
    });
});
 </script>

</head>
<body style="padding-top: 60px">
		<div class="container">
		<c:forEach items="${navproducts}" var="product">
			<div class="col-xs-3 w3-animate-zoom">
				<div class="img">
					<a href="${ProductList}"> <img height="192px"
						width="192px" alt="${product.pid}"
						src="<c:url value="/resources/images/${product.pid}.jpg"></c:url>">
					</a>

					 <img height="192px" width="192px"  alt="${product.pid}"
						src="<c:url value="WEB-INF/resources/images/product/${product.pid}.jpg"></c:url>">
					<div class="desc">
						<p>

							${product.name}<br> <i class="fa fa-inr" aria-hidden="true"></i>
							${product.price}
							<c:choose>
								<c:when test="${LoggedIn}">
									<form action="addtoCart/${userid}/${product.pid}">
										<input type="submit" value="Add to Cart"
											class="btn btn-xs btn-success btn-block">

									</form>
								</c:when>
							</c:choose>
						</p>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
		<c:choose>
		<c:when test="${UserClickedCart}">
			<c:import url="/WEB-INF/views/CartPage.jsp"></c:import>
		</c:when>
	</c:choose>
	



</body>