<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
    </head>
    <jsp:include page="index.jsp"></jsp:include>
    <body>
        <h3>Welcome, Enter The Employee Details</h3>
        <form:form method="POST" action="saveUser" modelAttribute="users">
             <table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td align= "center" colspan="2">Supplier Module</td>
			</tr>
			   <tr>
                    <td><form:label path="username">username</form:label></td>
                    <td><form:input path="username"/></td>
                </tr>
                <tr>
                    <td><form:label path="firstname">firstname</form:label></td>
                    <td><form:input path="firstname"/></td>
                </tr>
                <tr>
                    <td><form:label path="lastname">last name</form:label></td>
                    <td><form:input path="lastname"/></td>
                </tr>
                
                
                
                <tr>
                    <td><form:label path="email">email</form:label></td>
                    <td><form:input path="email"/></td>
                </tr>
                <tr>
                    <td><form:label path="contact">Contact Number</form:label></td>
                    <td><form:input path="contact"/></td>
                </tr>
                
                
                
                
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>