<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tambah Opening Hour</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">		
</head>
<body>
	<div class="center-items">
	    <h2>Tambah Opening Hour</h2>
	    <div id="container">
	    	<form:form action="open-saveOpening" modelAttribute="opening" method="POST">
	    		<form:hidden path="id" />
	    		<table>
	    			<tbody>
	    				<tr>
	    					<td><label>Hari:</label></td>
	    					<td><form:input path="day" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Waktu Buka:</label></td>
	    					<td><form:input path="openTime" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Waktu Tutup:</label></td>
	    					<td><form:input path="closeTime" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Lokasi Wisata:</label></td>
	    					<td><form:input path="tourLocation" /></td>
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
</body>
</html>