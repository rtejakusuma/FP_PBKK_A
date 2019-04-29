<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	    <h2>User List</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addUser">Add User</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Role ID</th>					
				</tr>
			</thead>
			<c:forEach var="user" items="${users}">
				<tbody>
					<tr>
						<th style="width: 5%" scope="row">${user.id}</th>
						<td style="width: 15%">${user.username}</td>
						<td style="width: 15%">${user.email}</td>
						<td style="width: 15%">${user.role}</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <button class="btn btn-primary"><a href="../home">Back home</a></button>
    </div>	
</body>
</html>