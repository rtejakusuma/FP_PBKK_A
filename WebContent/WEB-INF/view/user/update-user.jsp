<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Form Input</title>
	
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"  rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css"  rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/font_rametto.css"  rel="stylesheet">
	
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
		<h1>Update Data Pengguna</h1>
		<br>
		<div class="grid-container">
			<div></div>
			<form:form method="POST" action="saveUser?password_confirm=0" modelAttribute="user">
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
				    </div>
			    </div>
			</form:form>
		</div>
	</div>
	</div>
	</section>
</body>
</html>