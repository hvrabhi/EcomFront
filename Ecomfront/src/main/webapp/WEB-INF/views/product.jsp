<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>
<jsp:include page="index.jsp"></jsp:include>

<c:url var="actionUrl" value="saveProduct" />

<form:form  commandName="product" method="post" action="${actionUrl }" class="form-horizontal" id="btn-add"  enctype="multipart/form-data">>



<h3 align="center">
			<c:if test="$(category.id==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty product.id}">
		      Update Product for Id: <c:out value="${product.id}" />
				 <form:hidden path="id"/> 
			</c:if>
			</h3>

		
	<div class="form-group">
		<div class="col-xs-4">
		<c:if test="${product.id!=0}">
		<form:input type="hidden" name="id" path="id" iplaceholder="product Id" class="form-control" />
			</c:if>
		</div>
	</div>



	<div class="form-group">
		<label for="category Name" class="col-xs-4 control-label">Product Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="name" placeholder="Product Name" class="form-control" />
		</div>
	</div>
	

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Product Description</label>
		<div class="col-xs-4">
			<form:input name="description" id="description" path="description" placeholder="Product Description" maxlength="15" class="form-control" />
		</div>
	</div>



	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product Price</label>
		<div class="col-xs-4">
			<form:input name="id" path="price" placeholder="Product Price" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="Product Quantity" class="col-xs-4 control-label">Product Quantity</label>
		<div class="col-xs-4">
			<form:input name="id" path="quantity" placeholder="Product Quantity" class="form-control" />
		</div>
	</div>
	

<%-- 
	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product instock</label>
		<div class="col-xs-4">
			<form:input name="id" path="instock" placeholder="Product instock" class="form-control" />
		</div>
	</div>
 --%>
	<!-- 	List of Category	 -->

	
	<div class="form-group">
		<label for="Product Category" class="col-xs-4 control-label">Product Category</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="cid" required="true">
	<c:forEach items="${categoryList}" var="category">
	<form:option class="form-control" value="${category.id}">${category.cname}	     </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	<!--  List of Supplier  -->
	
		<div class="form-group">
		<label for="Product Supplier" class="col-xs-4 control-label">Product Supplier</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="sid" required="true">
	<c:forEach items="${supplierList}" var="supplier">
	<form:option class="form-control" value="${supplier.id}">${supplier.suppliername}	     </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	
	
	<div class="form-group">
		<label for="Product Image" class="col-xs-4 control-label">Product Image</label>
		<div class="col-xs-4">
		<input type="file" name="file" class="form-control" />
		</div>
	</div>
	


	<div class="form-group">  
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
		<c:if test="${product.id==0}">
		<input type="submit" value="Add Product" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${product.id!=0}">
		
	   <input type="submit" value="Update Product" id="btn-update" class="btn btn-primary" >
	  </c:if>
		
		
		</div>
	</div>
</form:form>


</body>
</html>