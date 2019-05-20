<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">	
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/all.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep1.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/discount/header.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="menulist">
      <ul>
      	<li><a href="${pageContext.request.contextPath}/home">Beranda</a></li>
          <li><a href="../tour/list">Obyek Wisata</a></li>
          <li><a class="pindah1" href="../discount/list">Promo</a></li>
          <li><a class="pindah1" href="../user/list">User</a></li>
          <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
      </ul>
  </div>
<!-- Team -->
<section id="team" class="pb-7">
    <div class="container">
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
	    <h2>Daftar Pengguna</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<a href="addUserForm">
	    		<button class="btn btn-primary">Tambahkan Pengguna</button>
	    	</a>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
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
						<td style="width: 15%">${user.username}</td>
						<td style="width: 15%">${user.email}</td>
						<c:choose>
							<c:when test="${user.role == 1}"><td style="width: 15%">Admin</td></c:when>
							<c:otherwise><td style="width: 15%">User</td></c:otherwise>
						</c:choose>
						<td style="width: 15%">
							<a title='Update User' href="${updateLink}">
								<button class="btn btn-primary">Ubah</button>
							</a>
							<a title='Delete User' onclick="confirm('${user.id}')">					
								<button class="btn btn-danger">Hapus</button>
							</a>
						</td>						
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <div class="col-3-md" style="float: right; margin: 16px 0;">
	    	
	    </div>
    </div>	
    </div></section>
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
		}).then((result) => {
			if(result.value) {
		  		window.location.href = "${deleteLink}?userId="+id; 		
			}
		});
	}
</script>
</html>