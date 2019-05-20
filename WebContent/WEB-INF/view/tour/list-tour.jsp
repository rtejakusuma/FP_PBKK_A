<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Daftar Tempat Wisata</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/all.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep1.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/header.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/discount/load1.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	 <!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
	 <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	</head>

<body>
	<c:if test="${role == 0 }">
<div class="menulist">
      <ul>
          <li><a href="../tour/list">Obyek Wisata</a></li>
          <li><a class="pindah1" href="../discount/list">Promo</a></li>
          <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
      </ul>
  </div>
</c:if>
<c:if test="${role == 1 }">
<div class="menulist">
      <ul>
          <li><a href="../tour/list">Obyek Wisata</a></li>
          <li><a class="pindah1" href="../discount/list">Promo</a></li>
          <li><a class="pindah1" href="../user/list">User</a></li>
          <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
      </ul>
  </div>
</c:if>
	
	<section id="team" class="pb-7">
		<div class="container">
			
		    <c:if test="${role == 1 }">
		        	<h5 class="section-title h1"><strong>List Wisata!</strong></h5>
		    </c:if>
			<c:if test="${role == 0 }">
			<div class="container">
			<c:forEach var="tour" items="${tours}">
			   <div class="row">
			      <div class="btn itemservice col-md-11">
			         <div class="card flex-md-row mb-4 h-md-250">
			            <div class="card-body d-flex flex-column align-items-start">
			               <strong class="d-inline-block mb-2 text-primary" href="">${tour.name}</strong>
			               <h6 class="mb-0">
			                  <strong class="text-dark">Pengunjung : ${tour.capacity}</strong>
			               </h6>
			               <!--<div class="mb-1 text-muted small">Nov 12</div>-->
			               <p class="card-text mb-auto">${tour.description}</p>
			               <a class="btn btn-outline-primary" role="button" href="">Check Ticket</a>
						</div>
			            <img class="card-img-right flex-auto d-none d-lg-block" src="${pageContext.request.contextPath}/resources/wisatauser/image4.jpg" style="width: 320px; height: 200px;">
			         </div>
			      </div>
				</div>
				 </c:forEach>
			</div>
			</c:if>
			
			<c:if test="${role == 1 }">
				<div class="center-items">
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
			</c:if>
		</div>
	</section>
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