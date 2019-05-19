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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>	
</head>
<body>
	<div class="center-items">
	    <h2>Daftar Tempat Wisata</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    <a href="addTourForm">
	    	<button class="btn btn-primary">Tambahkan Tempat Wisata</button>
	    </a>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nama</th>
					<th scope="col">Dekripsi</th>
					<th scope="col">Lokasi</th>	
					<th scope="col">Aksi</th>					
				</tr>
			</thead>
			<c:forEach var="tour" items="${tours}">
				<!-- set update url  -->
				<c:url var="updateLink" value="/tour/updateTourForm">
					<c:param name="tourId" value="${tour.id}" />
				</c:url>
				<!-- set delete url  -->
				<c:url var="deleteLink" value="/tour/delete"></c:url>
				
				<!-- set open hour url  -->
				<c:url var="openHour" value="/tour/open-addForm">
					<c:param name="id" value="${tour.id}" />
				</c:url>
				
				<tbody>
					<tr>
						<td style="width: 15%">${tour.id}</td>
						<td style="width: 15%">${tour.name}</td>
						<td style="width: 15%">${tour.description}</td>
						<td style="width: 15%">${tour.location}</td>
						<td>
							<a title='Update tour' href="${updateLink}">
								<button class="btn btn-primary">Ubah</button>
							</a>
							<a title='Add open hour' href="${openHour}">
								<button class="btn btn-secondary">Jam buka</button>
							</a>							
							<a title='Delete tour' onclick="confirm('${tour.id}')">
								<button class="btn btn-danger">Hapus</button>
							</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <div class="col-3-md" style="float: right; margin: 16px 0;">
	    	<a href="${pageContext.request.contextPath}/home">
	    		<button class="btn btn-primary">Beranda</button>
	    	</a>
	    </div>
    </div>	
</body>
<script>
	function confirm(id){
		swal.fire({
			title: 'Yakin ingin menghapus data tour?',
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
		  		window.location.href = "${deleteLink}?tourId="+id; 		
			}
		});
	}
</script>
</html>