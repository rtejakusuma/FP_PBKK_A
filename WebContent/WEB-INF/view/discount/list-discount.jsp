<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link href="${pageContext.request.contextPath}/resources/discount/loading1.css"rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/discount/load1.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/discount/header.css" rel="stylesheet">
	
</head>

<div class="menulist">
      <ul>
          <li><a href="../tour/list">Obyek Wisata</a></li>
          <li><a class="pindah1" href="">Promo</a></li>
          <li><a class="pindah1" href="Status/status.html">Status</a></li>
          <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
      </ul>
  </div>
<!-- Team -->
<section id="team" class="pb-7">
    <div class="container">
        <c:if test="${role == 0 }">
        	<h5 class="section-title h1"><strong>PROMOMU!</strong></h5>
        	</c:if>
        <c:if test="${role == 1 }">
        	<h5 class="section-title h1"><strong>List Promo!</strong></h5>
        </c:if>
        <div class="row">
        	<c:if test="${role == 0 }">
	            <!-- Team member -->
				<c:forEach var="discount" items="${discounts}">
	            <div class="">
	                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
	                    <div class="mainflip">
	                        <div class="frontside">
	                            <div class="card">
	                               <p><img class=" img-fluid" src="${pageContext.request.contextPath}/resources/discount/aset-promo.jpg" ></p>
	                            </div>
	                        </div>
	                        <div class="backside">
	                            <div class="cardback text-center">
	                                    <h4 class="card-title"><strong>${discount.code}</strong></h4>
	                                    <p class="card-text">Dapatkan diskon sebesar </p>
										<h1><strong>${discount.discountValue}%</strong></h1>
										<p class="card-text">${discount.startTime} sampai ${discount.endTime}</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
				</c:forEach>
			</c:if>
			<c:if test="${role == 1 }">
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
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<a href="addDiscountForm">
	    		<button class="btn btn-primary">Tambahkan Promo</button>
	    	</a>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">Deskripsi</th>
					<th scope="col">Kode Promo</th>
					<th scope="col">Nilai diskon</th>
					<th scope="col">Waktu mulai</th>
					<th scope="col">Waktu berakhir</th>
					<th scope="col">Aksi</th>				
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
						<td>
							<a title='Update discount' href="${updateLink}">
								<button class="btn btn-primary">Ubah</button>
							</a>
							<a title='Delete discount' onclick="confirm('${discount.id}')">
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
    </div>
</section>
<!-- Team -->