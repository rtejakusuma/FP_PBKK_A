<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update Promo</title>
	
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
	    <h2>Update Promo</h2>
	    <div class="grid-container">
	    	<form:form action="saveDiscount" modelAttribute="discount" method="POST">
	    		<form:hidden path="id"/>
	    		<table>
	    			<tbody>
	    				<tr>
	    					<td><label>Deskripsi Promo:</label></td>
	    					<td><form:input path="description" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Kode Promo:</label></td>
	    					<td><form:input path="code" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Nilai Diskon:</label></td>
	    					<td><form:input path="discountValue" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Waktu Mulai:</label></td>
	    					<td><form:input type="date" path="startTime" value="${discount.startTime}" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Waktu Berakhir:</label></td>
	    					<td><form:input type="date" path="endTime" value="${discount.endTime}" /></td>
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
	    	<a href="${pageContext.request.contextPath}/discount/list">
	    		<button class="btn btn-primary">Daftar Promo</button>
	    	</a>
	    		    
	    </div>	 
    </div>	
    </div>
    </section>
</body>
</html>