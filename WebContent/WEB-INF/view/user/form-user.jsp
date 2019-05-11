<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User List</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">		
</head>
<body>
	<div class="center-items">
	    <h2>Add User</h2>
	    <div id="container">
	    	<form:form action="saveUser" modelAttribute="user" method="POST">
	    		<table>
	    			<tbody>
	    				<tr>
	    					<td><label>Username:</label></td>
	    					<td><form:input path="username" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Email:</label></td>
	    					<td><form:input path="email" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Password:</label></td>
	    					<td><form:password path="password" /></td>
	    				</tr>
	    					<td><label>Role:</label></td>
	    					<td><form:input path="role" /></td>
	    				<tr>
	    					<td><label></label></td>
	    					<td><input type="submit" value="Save" class="save"/></td>
	    				</tr>
	    			</tbody>
	    		</table>
	    	</form:form>
	    </div>
	    <button class="btn btn-primary"><a href="${pageContext.request.contextPath}/home">Back home</a></button>
    </div>	
</body>
</html>