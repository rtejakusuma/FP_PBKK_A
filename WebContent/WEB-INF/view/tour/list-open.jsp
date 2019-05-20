<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>List Open</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>	
</head>
<body>
	<div class="center-items">
	    <h2>Jam Buka ${opening[0].tourLocation.name }</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    <!-- set update url  -->
		<c:url var="addLink" value="/tour/open-addForm">
			<c:param name="id" value="${tour.id}" />
		</c:url>
	    <a href="${addLink }">
	    	<button class="btn btn-primary">Atur Jam Buka</button>
	    </a>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Hari</th>
					<th scope="col">Waktu Buka</th>
					<th scope="col">Waktu Tutup</th>			
				</tr>
			</thead>
			<c:forEach var="item" items="${opening}" varStatus="loop"><tbody>
					<tr>
						<td style="width: 15%">${loop.index+1}</td>
						<td style="width: 15%">${days.get(loop.index)}</td>
						<td style="width: 15%">${item.openTime}</td>
						<td style="width: 15%">${item.closeTime}</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <div class="col-3-md" style="float: right; margin: 16px 0;">
	    	<a href="${pageContext.request.contextPath}/tour/list">
	    		<button class="btn btn-primary">Daftar Wisata</button>
	    	</a>
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