<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Form Input</title>
	
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font_rametto.css" />" rel="stylesheet">
</head>
<body>
	<div class="center-items">
		<h1>Update Data Pengguna</h1>
		<br>
		<div class="grid-container">
			<div></div>
			<form:form method="POST" action="saveUser" modelAttribute="user">
				<form:hidden path="id" />
				<div class="form-group row">					
				    <form:label path="username">Nama Pengguna  <form:errors path="username" cssClass="error"/></form:label>				    
				    <div class="col-sm-10">				    	
				    	<form:input path="username" cssClass="form-control form-control-lg"/>
				    </div>
			    </div>			 
			    <div class="form-group row">
				    <form:label path="email">Alamat Email <form:errors path="email" cssClass="error"/></form:label>
				    <div class="col-sm-10">				    	
				    	<form:input path="email" cssClass="form-control form-control-lg"/>
				    </div>
			    </div>
			    <div class="form-group row">
				    <form:label path="email">Tipe Pengguna <form:errors path="role" cssClass="error"/></form:label>
				    <div class="col-sm-10">				    	
				    	<form:select path="role" cssClass="form-control form-control-lg">
				    		<form:option value="0">User</form:option>
				    		<form:option value="1">Admin</form:option>
				    	</form:select>
				    </div>
			    </div>
			    <form:input type="hidden" path="password" value="${user.password}" />
	    		<div class="form-group row">
				    <div class="col-sm-10">
				      <button type="submit" class="btn btn-primary">Kirim</button>
				      <button class="btn btn-secondary"><a href="${pageContext.request.contextPath}/user/list">Kembali</a></button>
				    </div>
			    </div>
			</form:form>
			<div></div>
		</div>
	</div>
</body>
</html>