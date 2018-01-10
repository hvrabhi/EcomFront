<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="saveCategory" />

<form:form  commandName="category" method="post" action="${actionUrl }" class="form-horizontal" id="btn-add">



<h3>
			<c:if test="$(category.id==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty category.id}">
		      Update Category for Id: <c:out value="${category.id}" />
				 <form:hidden path="id"/> 
			</c:if>
			</h3>

		
	<div class="form-group">
		<div class="col-xs-4">
		<c:if test="${category.id!=0}">
		<form:input type="hidden" name="id" path="id" iplaceholder="Category Id" class="form-control" />
			</c:if>
		</div>
	</div>



	<div class="form-group">
		<label for="category Name" class="col-xs-4 control-label">Category Name</label>
		<div class="col-xs-4">
			<form:input name="categoryName" path="categoryName" placeholder="Category Name" class="form-control" />
	        <form:errors path="categoryName" cssStyle="color:#ff0000"></form:errors>
		</div>
	</div>

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Category description</label>
		<div class="col-xs-4">
			<form:input name="categoryDescription"  path="categoryDescription" placeholder="Category Description" class="form-control" />
			  <form:errors path="categoryDescription" cssStyle="color:#ff0000"></form:errors>
		
		</div>
	</div>



	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
		<c:if test="${category.id==0}">
		<input type="submit" value="Add Category" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${category.id!=0}">
		
	   <input type="submit" value="Update Category" id="btn-update" class="btn btn-primary" >
	  </c:if>
		
		
		</div>
	</div>
</form:form>



		<table class="table table-striped table-bordered"  style="width: 80%">
			<thead>
				<tr>
					<th width="2%" style="background-color: blue;">S.N</th>
					<th width="2%">Category ID</th>
					<th width="2%">Category Name</th>
					<th width="2%">Category Description</th>
					<th width="2%">Category Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categoryList}" var="category" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${category.id}" /></td>
						<td><c:out value="${category.categoryName}" /></td>
						<td><c:out value="${category.categoryDescription}" /></td>
						
						<td><nobr>
<a class="btn btn-primary" href="editcategory/${category.id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a>

<a class="btn btn-primary"  href="removecategory/${category.id}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	


