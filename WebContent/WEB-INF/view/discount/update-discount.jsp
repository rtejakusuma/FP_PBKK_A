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
</head>
<body>
	<div class="center-items">
	    <h2>Update Promo</h2>
	    <div id="container">
	    	<form:form action="saveDiscount" modelAttribute="discount" method="POST">
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
	    					<td><form:input type="date" path="startTime" /></td>
	    				</tr>
	    				<tr>
	    					<td><label>Waktu Berakhir:</label></td>
	    					<td><form:input type="date" path="endTime" /></td>
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
	    	<button class="btn btn-primary"><a href="${pageContext.request.contextPath}/discount/list">Daftar Promo</a></button>
	    	<button class="btn btn-primary"><a href="${pageContext.request.contextPath}/home">Beranda</a></button>
	    </div>	 
    </div>	
</body>
</html>