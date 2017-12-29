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

<table class="table table-striped table-bordered" style="width:100%">
		
			<tr bgcolor="gray">
				<td>Category ID</td>
				<td>Category Name</td>
				<td>Operation</td>
			</tr>
	
	
		<c:forEach items="${categoryList}" var="category">
			<tr bgcolor="#85C1E9">
				<td>${category.id}</td>
				<td>${category.cname}</td>
				<td>
						<a class="btn btn-danger" href="removecategory/${category.id}"/>DELETE</a>
						<a class="btn btn-success" href="editcategory/${category.id}"/>EDIT</a>
				</td>
			</tr>
		</c:forEach>

		</table><br>
</body>
</html>