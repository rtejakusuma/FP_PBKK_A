<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>PiknikYuk!</title>
  <!-- Font Awesome Icons -->
  <link href="${pageContext.request.contextPath}/resources/home/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="${pageContext.request.contextPath}/resources/home/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/huser/creative.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/home/css/creative.css" rel="sylesheet">

  <!--Carousell-->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 100%;
    margin:0px;
  }
  </style>
</head>

<body id="page-top">
  <c:if test="${role == null }">
  <div class="menulist">
        <ul>
            <li><a href="${pageContext.request.contextPath}/tour/list">Obyek Wisata</a></li>
            <li><a href="${pageContext.request.contextPath}/discount/list">Promo</a></li>
            <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/login">Masuk</a></li>
	            <li><a href="${pageContext.request.contextPath}/user/addUserForm">Daftar</a></li>
            </div>
        </ul>
  </div>
  </c:if>
  <c:if test="${role == 1 }">
  <div class="menulist">
        <ul>
            <li><a href="${pageContext.request.contextPath}/tour/list">Obyek Wisata</a></li>
            <li><a href="${pageContext.request.contextPath}/discount/list">Promo</a></li>
            <li><a href="${pageContext.request.contextPath}/user/list">Users</a></li>
            <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
        </ul>
  </div>
  </c:if>
  <c:if test="${role == 0 }">
  <div class="menulist">
        <ul>
            <li><a href="${pageContext.request.contextPath}/tour/list">Obyek Wisata</a></li>
            <li><a href="${pageContext.request.contextPath}/discount/list">Promo</a></li>

            <div style="float:right;">
	            <li><a href="${pageContext.request.contextPath}/logout">Keluar</a></li>
            </div>
        </ul>
  </div>
  </c:if>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	
	      <div class="item active">
	        <img src="${pageContext.request.contextPath}/resources/home/img/image1.jpg" alt="Chania" width="600" height="600">
	        <div class="carousel-caption">
	          <h3>Taman Safari Prigen</h3>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/home/img/image2.jpg" alt="Chania" width="600" height="345">
	        <div class="carousel-caption">
	          <h3>Museum Angkut</h3>
	        </div>
	      </div>
	    
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/home/img/image3.jpg" alt="Flower" width="600" height="345">
	        <div class="carousel-caption">
	          <h3>Jatim Park 3</h3>
	        </div>
	      </div>
	  
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>

  <!-- About Section -->
  <section class="page-section bg-primary" id="about">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="text-white mt-0">PiknikYuk!</h2>
          <hr class="divider light my-4">
          <p class="text-white-50 mb-4">PiknikYuk adalah aplikasi yang memudahkan anda dalam berwisata</p>
        </div>
      </div>
    </div>
  </section>
  

  <!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="mt-0">Hubungi Kami</h2>
          <hr class="divider my-4">
          <p class="text-muted mb-5">Ingin mendaftarkan tempat wisata anda ? Segera hubungi kami!</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 ml-auto text-center">
          <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
          <div>08888888888</div>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
          <!-- Make sure to change the email address in anchor text AND the link below! -->
          <a class="d-block" href="mailto:piknikyuk!@website.com">piknikyuk!@website.com</a>
        </div>
      </div>
    </div>
  </section>


  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value="/resources/home/vendor/jquery/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/home/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Plugin JavaScript -->
  <script src="<c:url value="/resources/home/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
  <script src="<c:url value="/resources/home/vendor/magnific-popup/jquery.magnific-popup.min.js"/>"></script>

  <!-- Custom scripts for this template -->
  <script src="<c:url value="/resources/home/js/creative.min.js"/>"></script>

</body>

</html>