<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Example of Bootstrap 3 Dropdowns within a Navbar</title>


<link href="resources/lib/bootstrap-3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/lib/bootstrap-3.3.6/css/bootstrap.css"
	rel="stylesheet" />


<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>
</head>
<body>
	${error}
	<nav class="navbar navbar-inverse  navbar-fixed-top" role="navigation">

		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar" data-hover="dropdown">
					> <span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
					<li><a href="aboutus.html"> <span
							class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
							About
					</a></li>
					<li class="dropdown"><a href="index.html"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
							Menu <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="contactus.html#">Main Courses</a></li>
							<li><a href="contactus.html#">Bootstrap</a></li>
							<li><a href="contactus.html#">Asp</a></li>
							<li><a href="contactus.html#">SQl</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">PHP</li>
							<li><a href="contactus.html#">MySQl</a></li>

						</ul></li>
					<li><a href="#"><span class="fa fa-envelope-o"></span>
							Contact</a></li>


					<li class="dropdown"><a href="index.html"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
							Category <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${categoryList}" var="category">

								<li><a class="alink"
									href=" nav/<c:out value="${category.id}" />"> <c:out
											value="${category.categoryName}" />
								</a></li>

							</c:forEach>
						</ul></li>
				</ul>



				<ul class="nav navbar-nav navbar-right">

					<sec:authorize access="!isAuthenticated()">
						<li><a href="login"> <span
								class="glyphicon glyphicon-log-in"></span></a></li>
						<li><a href="register"> <span
								class="glyphicon glyphicon-user"></span></a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a style="color: white"
							href="${pageContext.request.contextPath}/Home">Hello <b><sec:authentication
										property="principal.username" /></b></a></li>

						<li><c:url value="/j_spring_security_logout" var="logoutUrl" />
							<a href="${logoutUrl}">Log Out</a><span
							class="glyphicon glyphicon-log-out"></span></li>




						<li><a href="viewcart"> <span
								class="glyphicon glyphicon-shopping-cart">
									${CartPrice},${cartsize}</span>
						</a></li>
					</sec:authorize>


				</ul>

			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<c:forEach items="${HomeList}" var="product">

			<div class="col-md-4">
				<!-- 
			<div class="col-xs-3 w3-animate-zoom">
		 -->
				<div class="thumbnail">
					<img class="img-thumbnail" style="padding-top: 12px" src="base-instance/${product.image}">
					<div class="caption">
						<h4 class="pull-right">${product.price}</h4>
						<h4>
							<a href="#">${product.name}</a>
						</h4>
						<p>${product.description}.</p>
						<form action="addToCart/${product.id}">
							<input type="submit" value="Add to Cart" class="btn btn-primary">

						</form>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>



	<c:choose>
		<c:when test="${!empty SuccessMessage}">
			<td colspan="2">
				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${SuccessMessage}
				</div>
			</td>
		</c:when>
		<c:when test="${!empty ExistingMessage}">
			<td colspan="2">
				<div class="alert alert-danger fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>${ExistingMessage}
				</div>
			</td>
		</c:when>
	</c:choose>


	<c:if test="${LoginPageClicked}">
		<jsp:include page="login.jsp"></jsp:include>
	</c:if>

	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/CartPage.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/views/RegistrationPage.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${Clickedshowproduct}">
			<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${Clickedcatproduct}">
			<c:import url="/WEB-INF/views/catproducts.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/views/ListCategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<script type="text/javascript">
	
$(function() {
 $('#test').delay(1000).fadeOut();
});

</script>
	<!-- scripts -->
	<script src="resources/lib/jquery/jquery-1.10.2.js"></script>
	<script src="resources/lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>
	<!-- <script src="resources/lib/bootstrap-3.3.6/js/bootstrap-auto-dismiss-alert.js"></script> -->

</body>
</html>
