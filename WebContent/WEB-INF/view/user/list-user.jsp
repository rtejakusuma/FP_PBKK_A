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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>	
</head>
<body>
	<div class="center-items">
		<c:if test="${delete_flag == 1 }">
			<script>
				Swal.fire(
					'Berhasil menghapus!',
		            'Data pengguna berhasil dihapus!',
		            'success'
				);
			</script>
		</c:if>
	    <h2>User List
	    <c:if test="${delete_flag == 1 }">
			${delete_flag}
		</c:if>
	    </h2>
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
				<!-- set delete url  -->
				<c:url var="deleteLink" value="/user/delete"></c:url>
				
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
							<a title='Delete User' onclick="confirm('${user.id}')"><i class="fas fa-trash"></i></a>
						</td>						
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <button class="btn btn-primary"><a href="${pageContext.request.contextPath}/home">Back home</a></button>
    </div>	
</body>
<script>
	function confirm(id){
		swal.fire({
			title: 'Yakin ingin menghapus data pengguna?',
			text: "Data yang dihapus tidak dapat kembali",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yakin, hapus data',
			cancelButtonText: 'Tidak, kembali',
			allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false
		}).then(function(){
	  		window.location.href = "${deleteLink}?userId="+id; 
	  	});
	}
</script>
</html>