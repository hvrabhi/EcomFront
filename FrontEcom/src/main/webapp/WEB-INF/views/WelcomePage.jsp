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
<title>WELCOME</title>


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
					

									</ul>



				<ul class="nav navbar-nav navbar-right">

						<li class="dropdown"><a href="index.html"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
							Category <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${categoryList}" var="category">

								<li><a class="alink"
									href=" nav/<c:out value="${category.cid}" />"> <c:out
											value="${category.categoryName}" />
								</a></li>

							</c:forEach>
						</ul></li>
						
					<sec:authorize access="!isAuthenticated()">
						<li><a href="login"> Login</a></li>
						<li><a href="register"> Register</a></li>
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


	<c:if test="${LoginPageClicked}">
		<jsp:include page="LoginPage.jsp"></jsp:include>
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
