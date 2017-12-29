<%@ page language="java" contentType="text/html" import="org.spring.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>supplier</title>


</head>
	  <jsp:include page="index.jsp"></jsp:include>
    <body>
	
			<!-- <form action="AddSupplier" method="post">-->

	<form:form  method="POST" action="AddSupplier" modelAttribute="supplier" >
				<table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td align= "center" colspan="2">Supplier Module</td>
			</tr>
			
		
			<tr>
				<td><form:label path="suppliername">Supplier Name</form:label></td>
                    <td><form:input path="suppliername"/></td>
                
			</tr>
		
			<tr>
				<td><form:label path="supplieraddress">Supplier Address</form:label></td>
                <td><form:input path="supplieraddress"/></td>
			</tr>
	
		<tr>
			<td colspan="2">
				<center><input type="submit" value="Insert" class="btn btn-success"/>
				</center>
			</td>
		</tr>
	</table>
	</form:form>
		

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
			
				<a class="btn btn-danger" href="editsupplier/${supplier.id}"/>EDIT</a>/
				<a class="btn btn-success" href="removesupplier/${supplier.id}"/>DELETE</a>
			</td>
		</tr>
	</c:forEach>

</table>
		

</body>
</html>