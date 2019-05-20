<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/resources/open/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/open/css/material-bootstrap-wizard.css" rel="stylesheet" />
	<title>Tambah Jam Buka</title>

</head>

<body>
	<div class="image-container set-full-height" style="background-image: url('${pageContext.request.contextPath}/resources/open/img/background.jpg')">
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="red" id="wizard">		                
		                	<!-- set post url  -->
							<c:url var="saveOpenHour" value="/tour/open-save">
								<c:param name="id" value="${tourId}" />
							</c:url>
		                    <form:form action="${saveOpenHour}" modelAttribute="form"  method="POST">	
		                <!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        		Wisata ${form.openings[0].tourLocation.name}
		                        	</h3>
									<h5>Ubah Data Jam Buka</h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#details0" data-toggle="tab">Senin</a></li>
										<li><a href="#details1" data-toggle="tab">Selasa</a></li>
										<li><a href="#details2" data-toggle="tab">Rabu</a></li>
										<li><a href="#details3" data-toggle="tab">Kamis</a></li>
										<li><a href="#details4" data-toggle="tab">Jum'at</a></li>
										<li><a href="#details5" data-toggle="tab">Sabtu</a></li>
										<li><a href="#details6" data-toggle="tab">Minggu</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                        <c:forEach varStatus="i" items="${form.openings}" var="data">
		                            <div class="tab-pane" id="details${i.index}">
		                            	<div class="row">		                            	
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<form:hidden path="openings[${i.index}].id"/>
			                                          	<form:hidden path="openings[${i.index}].day"/>
			                                          	<form:input onfocus="pick(this)" path="openings[${i.index}].openTime" cssClass="form-control"/>
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<form:input onfocus="pick(this)" path="openings[${i.index}].closeTime" cssClass="form-control"/>
			                                        </div>
												</div>
												
		                                	</div>
		                            	</div>
		                            </div>
	                            </c:forEach>	
	                        	<div class="wizard-footer">
	                            	<div class="pull-right">
	                                    <input type='button' class='btn btn-next btn-fill btn-danger btn-wd' name='next' value='Selanjutnya' />
	                                    <input type='submit' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Kirim' />
	                                </div>
	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Sebelumya' />

										<div class="footer-checkbox">
											<div class="col-sm-12">
					
										  </div>
										</div>
	                                </div>
	                                <div class="clearfix"></div>
	                        	</div>
		                    </form:form>
		                </div>
						
		            </div> <!-- wizard container -->
		        </div>
	    	</div> <!-- row -->
		</div> <!--  big container -->
	</div>

</body>
	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/resources/open/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/open/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/open/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="${pageContext.request.contextPath}/resources/open/js/material-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="${pageContext.request.contextPath}/resources/open/js/jquery.validate.min.js"></script>
	<script>
		function pick(x){
			x.type = "time";
		};
	</script>
</html>
