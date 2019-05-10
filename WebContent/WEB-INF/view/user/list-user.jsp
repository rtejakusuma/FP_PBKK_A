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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">	
</head>
<body>
	<div class="center-items">
	    <h2>User List</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addUserForm">Add User</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Tipe Pengguna</th>
					<th scope="col">Aksi</th>					
				</tr>
			</thead>
			<c:forEach var="user" items="${users}">
				<!-- set update url  -->
				<c:url var="updateLink" value="/user/updateUserForm">
					<c:param name="userId" value="${user.id}" />
				</c:url>
				<tbody>
					<tr>
						<th style="width: 5%" scope="row">${user.id}</th>
						<td style="width: 15%">${user.username}</td>
						<td style="width: 15%">${user.email}</td>
						<c:choose>
							<c:when test="${user.role == 1}"><td style="width: 15%">Admin</td></c:when>
							<c:otherwise><td style="width: 15%">User</td></c:otherwise>
						</c:choose>
						<td style="width: 15%">
							<a title='Update User' href="${updateLink}"><i class="fas fa-edit"></i></a>					
							<a title='Delete User' href="#"><i class="fas fa-trash"></i></a>
						</td>						
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <button class="btn btn-primary"><a href="../home">Back home</a></button>
    </div>	
</body>
</html>