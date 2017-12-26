<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>supplier</title>


</head>
	  
	<jsp:include page="index.jsp"></jsp:include>
    <body>
			
	<form:form  method="POST" action="AddCategory" modelAttribute="category" >
				<table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td align= "center" colspan="2">Category Module</td>
			</tr>
			
		
			<tr>
				<td><form:label path="cname">Category Name</form:label></td>
                    <td><form:input path="cname"/></td>
                
			</tr>
		
		<tr>
			<td colspan="2">
				<center><input type="submit" value="Insert" class="btn btn-success"/>
				</center>
			</td>
		</tr>
	</table>
	</form:form>
		

</body>
</html>