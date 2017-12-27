<%@ page language="java" contentType="text/html" import="org.spring.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>

<table class="table table-striped table-bordered" style="width:100%">
	<tr bgcolor="gray">
		<td>Supplier ID</td>
		<td>Supplier Name</td>
		<td>Supplier Address</td>
		<td>Operation</td>
	</tr>
	
	<c:forEach items="${supplierList}" var="supplier">
		<tr bgcolor="#F7DC6F  ">
			<td>${supplier.id}</td>
			<td>${supplier.suppliername}</td>
			<td>${supplier.supplieraddress}</td>
			<td>
			
				<a class="btn btn-danger" href="#"/>DELETE</a>/
				<a class="btn btn-success" href="#"/>EDIT</a>
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>