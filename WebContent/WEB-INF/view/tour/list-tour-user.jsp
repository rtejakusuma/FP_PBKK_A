<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<head>
	<link rel="stylesheet" type="text/css" href="all.css">
	<link rel="stylesheet" type="text/css" href="mantep1.css">
	<link rel="stylesheet" type="text/css" href="mantep.css">
	<link rel="stylesheet" type="text/css" href="header.css">
</head>

<body>
<div class="menulist">
      <ul>
          <li><a href="">Obyek Wisata</a></li>
          <li><a class="pindah1" href="">Promo</a></li>
          <li><a class="pindah1" href="../Status/status.html">Status</a></li>
      </ul>
</div>

<div class="container">
   <div class="row">
   <c:forEach var="tour" items="${tours}">
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
            <img class="card-img-right flex-auto d-none d-lg-block" src="image4.jpg" style="width: 320px; height: 200px;">
         </div>
      </div>
      </c:forEach>
	</div>
</div>

</body>