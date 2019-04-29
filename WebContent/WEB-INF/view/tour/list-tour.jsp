<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Daftar Tempat Wisata</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="center-items">
	    <h2>Daftar Tempat Wisata</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addUserForm">Add User</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nama</th>
					<th scope="col">Dekripsi</th>
					<th scope="col">Lokasi</th>					
				</tr>
			</thead>
			<c:forEach var="tour" items="${tours}">
				<tbody>
					<tr>
						<th style="width: 5%" scope="row">${tour.id}</th>
						<td style="width: 15%">${tour.name}</td>
						<td style="width: 15%">${tour.description}</td>
						<td style="width: 15%">${tour.location}</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <button class="btn btn-primary"><a href="../home">Back home</a></button>
    </div>	
</body>
</html>