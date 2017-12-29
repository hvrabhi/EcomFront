<%@ page language="java" contentType="text/html" import="org.spring.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>

<table class="table table-striped table-bordered"  style="width: 80%">
			<thead>
				<tr>
					<th width="2%">S.N</th>
					<th width="2%">product ID</th>
					<th width="2%">product Name</th>
					<th width="2%">product Description</th>
					<th width="2%">Product Price</th>
					<th width="2%">Product InStock</th>
					<th width="2%">Product Category</th>
					<th width="2%">Product Supplier</th>
					<th width="2%">Product Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${product.id}" /></td>
						<td><c:out value="${product.name}" /></td>
						<td><c:out value="${product.description}" /></td>
						<td><c:out value="${product.price}" /></td>
						<td><c:out value="${product.instock}" /></td>
						<td><c:out value="${product.cid}" /></td>
						<td><c:out value="${product.sid}" /></td>
									<td><nobr>
<a class="btn btn-primary" href="editproduct/${product.id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a>

<a class="btn btn-primary"  href="removeproduct/${product.id}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>