<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="saveSupplier" />

<form:form  commandName="supplier" method="post" action="${actionUrl }" class="form-horizontal" id="btn-add">



<h3>
			<c:if test="$(supplier.id==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty supplier.id}">
		      Update Supplier for Id: <c:out value="${supplier.id}" />
				 <form:hidden path="id"/> 
			</c:if>
			</h3>

		
	<div class="form-group">
		<div class="col-xs-4">
		<c:if test="${supplier.id!=0}">
		<form:input type="hidden" name="id" path="id" iplaceholder="supplier Id" class="form-control" />
			</c:if>
		</div>
	</div>



	<div class="form-group">
		<label for="Supplier Name" class="col-xs-4 control-label">supplier Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="supplierName" placeholder="supplier Name" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Category description</label>
		<div class="col-xs-4">
			<form:input name="supplierAddress" id="merocode" path="supplierAddress" placeholder="Supplier Address" maxlength="15" class="form-control" />
		</div>
	</div>



	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
		<c:if test="${supplier.id==0}">
		<input type="submit" value="Add Supplier" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${supplier.id!=0}">
		
	   <input type="submit" value="Update Supplier" id="btn-update" class="btn btn-primary" >
	  </c:if>
		
		
		</div>
	</div>
</form:form>


	
		<table class="table table-striped table-bordered"  style="width: 80%">
			<thead>
				<tr>
					<th width="2%">S.N</th>
					<th width="2%">supplier ID</th>
					<th width="2%">supplier Name</th>
					<th width="2%">supplier Description</th>
					<th width="2%">Supplier Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${supplierList}" var="supplier" varStatus="loopCounter">
					<tr>
						<td><c:out value="${loopCounter.count}" /></td>
						<td><c:out value="${supplier.id}" /></td>
						<td><c:out value="${supplier.supplierName}" /></td>
						<td><c:out value="${supplier.supplierAddress}" /></td>
						
						<td><nobr>
<a class="btn btn-primary" href="editsupplier/${supplier.id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a>

<a class="btn btn-primary"  href="removesupplier/${supplier.id}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete
								</a>

							</nobr></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	


