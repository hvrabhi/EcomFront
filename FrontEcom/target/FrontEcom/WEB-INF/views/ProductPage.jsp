<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="saveProduct" />

<form:form  commandName="product" method="post" action="${actionUrl }" class="form-horizontal" id="btn-add"  enctype="multipart/form-data">>



<h3 align="center">
			<c:if test="$(category.cid==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty product.pid}">
		      Update Product for Id: <c:out value="${product.pid}" />
				 <form:hidden path="pid"/> 
			</c:if>
			</h3>

		
	<div class="form-group">
		<div class="col-xs-4">
		<c:if test="${product.pid!=0}">
		<form:input type="hidden" name="pid" path="pid" iplaceholder="product Id" class="form-control" />
			</c:if>
		</div>
	</div>



	<div class="form-group">
		<label for="category Name" class="col-xs-4 control-label">Product Name</label>
		<div class="col-xs-4">
			<form:input name="name" path="name" placeholder="Product Name" class="form-control" />
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
			<form:input name="id" path="instock" placeholder="Product Quantity" class="form-control" />
		</div>
	</div>
	

	
	<div class="form-group">
		<label for="Product Category" class="col-xs-4 control-label">Product Category</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="category_id" required="true">
	<c:forEach items="${categoryList}" var="category">
	<form:option class="form-control" value="${category.cid}">${category.categoryName}	     </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	<!--  List of Supplier  -->
	
		<div class="form-group">
		<label for="Product Supplier" class="col-xs-4 control-label">Product Supplier</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="supplier_id" required="true">
	<c:forEach items="${supplierList}" var="supplier">
	<form:option class="form-control" value="${supplier.sid}">${supplier.supplierName}	     </form:option>
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
		
			
		<c:if test="${product.pid==0}">
		<input type="submit" value="Add Product" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${product.pid!=0}">
		
	   <input type="submit" value="Update Product" id="btn-update" class="btn btn-primary" >
	  </c:if>
		
		
		</div>
	</div>
</form:form>


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
					<th width="2%">Product Image</th>
					<th width="2%">Product Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${product.pid}" /></td>
						<td><c:out value="${product.name}" /></td>
						<td><c:out value="${product.description}" /></td>
						<td><c:out value="${product.price}" /></td>
						<td><c:out value="${product.instock}" /></td>
						<td><c:out value="${product.category_id}" /></td>
						<td><c:out value="${product.supplier_id}" /></td>
						<td><img src="/resources/images/${product.pid}.jpg" height="50px" width="50px"></td>	
						<td><nobr>
<a class="btn btn-primary" href="editproduct/${product.pid}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a>

<a class="btn btn-primary"  href="removeproduct/${product.pid}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	


