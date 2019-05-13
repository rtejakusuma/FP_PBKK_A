<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Daftar Promo</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
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
		            'Data promo berhasil dihapus!',
		            'success'
				);
			</script>
		</c:if>
	    <h2>Daftar Promo</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addDiscountForm">Tambahkan Promo</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">Deskripsi</th>
					<th scope="col">Kode Promo</th>
					<th scope="col">Nilai diskon</th>
					<th scope="col">Waktu mulai</th>
					<th scope="col">Waktu berakhir</th>				
				</tr>
			</thead>
			<c:forEach var="discount" items="${discounts}">
				
				<!-- set update url  -->
				<c:url var="updateLink" value="/discount/updateDiscountForm">
					<c:param name="discountId" value="${discount.id}" />
				</c:url>
				<!-- set delete url  -->
				<c:url var="deleteLink" value="/discount/delete"></c:url>
				
				<tbody>
					<tr>
						<td style="width: 15%">${discount.description}</td>
						<td style="width: 15%">${discount.code}</td>
						<td style="width: 15%">${discount.discountValue}</td>
						<td style="width: 15%">${discount.startTime}</td>
						<td style="width: 15%">${discount.endTime}</td>
						<td><button class="btn btn-primary"><a title='Update discount' href="${updateLink}">Ubah</a></button>
						<button class="btn btn-danger"><a title='Delete discount' href="#" onclick="confirm('${discount.id}')">Hapus</a></button></td>
					</tr>
				</tbody>
			</c:forEach>
	    </table>
	    <div class="col-3-md" style="float: right; margin: 16px 0;">
	    	<button class="btn btn-primary"><a href="${pageContext.request.contextPath}/home">Beranda</a></button>
	    </div>	    	
    </div>	
</body>
<script>
	function confirm(id){
		swal.fire({
			title: 'Yakin ingin menghapus data promo?',
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
		  		window.location.href = "${deleteLink}?discountId="+id; 		
			}
		});
	}
</script>
</html>