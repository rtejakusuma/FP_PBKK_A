<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tambah Tour</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">		
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/all.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep1.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/mantep.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/wisatauser/header.css" rel="stylesheet" type="text/css">	
</head>
<body>
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
 <section id="team" class="pb-7">
	<div class="container">
		<div class="center-items">
		    <h5 class="section-title h1"><strong>Tambah Wisata!</strong></h5>
		    <div id="container">
		    	<form:form action="saveTour" modelAttribute="tour" method="POST">
		    		<form:hidden path="id" />
		    		<table>
		    			<tbody>
		    				<tr>
		    					<td><label>Nama Wisata:</label></td>
		    					<td><form:input path="name" /></td>
		    				</tr>
		    				<tr>
		    					<td><label>Deskripsi Wisata:</label></td>
		    					<td><form:input path="description" /></td>
		    				</tr>
		    				<tr>
		    					<td><label>Lokasi Wisata:</label></td>
		    					<td><form:input path="location" /></td>
		    				</tr>
		    				<tr>
		    					<td><label>Kapasitas Wisata:</label></td>
		    					<td><form:input path="capacity" /></td>
		    				</tr>
		    				<tr>
		    					<td><label>Harga Weekday:</label></td>
		    					<td><form:input path="weekdayPrice" /></td>
		    				</tr>
		    				<tr>
		    					<td><label>Harga Weekend:</label></td>
		    					<td><form:input path="weekendPrice" /></td>
		    				</tr>
		    				<tr>
		    					<td><label></label></td>
		    					<td><input type="submit" value="Save"/></td>
		    				</tr>
		    			</tbody>
		    		</table>
		    	</form:form>
		    </div>
		    <div class="col-3-md" style="float: right; margin: 16px 0;">
		    	<a href="${pageContext.request.contextPath}/tour/list">
		    		<button class="btn btn-primary">Daftar Tour</button>
		    	</a>
		    	<a href="${pageContext.request.contextPath}/home">
		    		<button class="btn btn-primary">Beranda</button>
		    	</a>
		    </div>	 
	    </div>	
	    </div>
	</section>
</body>
</html>