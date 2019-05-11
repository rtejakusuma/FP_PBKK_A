<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Daftar Promo</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="center-items">
	    <h2>Daftar Promo</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addDiscountForm">Tambahkan Promo</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Deskripsi</th>
					<th scope="col">Kode Diskon</th>
					<th scope="col">Nilai diskon</th>
					<th scope="col">Waktu mulai</th>
					<th scope="col">Waktu berakhir</th>				
				</tr>
			</thead>
			<c:forEach var="discount" items="${discounts}">
				<tbody>
					<tr>
						<th style="width: 5%" scope="row">${discount.id}</th>
						<td style="width: 15%">${discount.description}</td>
						<td style="width: 15%">${discount.code}</td>
						<td style="width: 15%">${discount.discountValue}</td>
						<td style="width: 15%">${discount.startTime}</td>
						<td style="width: 15%">${discount.endTime}</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <div class="col-3-md" style="float: right; margin: 16px 0;">
	    	<button class="btn btn-primary"><a href="${pageContext.request.contextPath}/home">Beranda</a></button>
	    </div>	    	
    </div>	
</body>
</html>