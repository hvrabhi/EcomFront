<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
    </head>
    <jsp:include page="index.jsp"></jsp:include>
    <body>
        <h3>Welcome, Enter The Employee Details</h3>
        <form:form method="POST" action="saveUser" modelAttribute="users">
            <div class="form-group">
		<label for="First Name" class="col-xs-4 control-label">First Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="firstName" placeholder="User First Name" class="form-control" />
		</div>
	</div>
	
	
	<br><br>
	
	<div class="form-group">
		<label for="First Name" class="col-xs-4 control-label">Last Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="lastName" placeholder="User First Name" class="form-control" />
		</div>
	</div>
	
	
	<br><br>

	<div class="form-group">
		<label for="Supplier Name" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<form:input name="id" path="email" placeholder="Email" class="form-control" />
		</div>
	</div>
<br>
	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<form:input name="password"  path="password" placeholder="User Password" class="form-control" />
		</div>
	</div>
<br>
	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Phone Number</label>
		<div class="col-xs-4">
			<form:input name="phone"  path="phone" placeholder="User Phone" class="form-control" />
		</div>
	</div>


<br>
	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
	
		<input type="submit" value="Add User" id="btn-add" class="btn btn-primary" >
	
	

		
		</div>
	</div>

        </form:form>
    </body>
</html>