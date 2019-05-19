<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    
	<title>Tambah Opening Hour</title>
	<link href="${pageContext.request.contextPath}/resources/open/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/open/css/material-bootstrap-wizard.css" rel="stylesheet" />
	
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="${pageContext.request.contextPath}/resources/open/css/demo.css" rel="stylesheet" />		
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
		                    <form:form action="open-save" modelAttribute="opening" method="POST">
		                    	<form:hidden path="id" />
	    						<form:hidden path="tourLocation" value="${param.id }" />
		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        		Tambah Jam Buka
		                        	</h3>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#details" data-toggle="tab">Senin</a></li>
										<li><a href="#details1" data-toggle="tab">Selasa</a></li>
										<li><a href="#details2" data-toggle="tab">Rabu</a></li>
										<li><a href="#details3" data-toggle="tab">Kamis</a></li>
										<li><a href="#details4" data-toggle="tab">Jum'at</a></li>
										<li><a href="#details5" data-toggle="tab">Sabtu</a></li>
										<li><a href="#details6" data-toggle="tab">Minggu</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                            <div class="tab-pane" id="details">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<form:input pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" 
							    						title="Format 24-jam! (HH:mm)" cssClass="form-control" 
							    						path="openTime"/>
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<form:input pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" 
							    						title="Format 24-jam! (HH:mm)" cssClass="form-control"
							    						path="closeTime"/>
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details1">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details2">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details3">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details4">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details5">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details6">
		                            	<div class="row">
		                                	<div class="col-sm-6">
												<div class="input-group">
												<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Start Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Finish Hour</label>
			                                          	<input name="name" type="text" class="form-control">
			                                        </div>
												</div>

		                                	</div>
		                            	</div>
		                            </div>
									<div class="tab-pane" id="details7">
		                            	<div class="row">
		                                	<h3>Klik Submit untuk input waktu</h3>
		                            	</div>
		                            </div>
		                        </div>
	                        	<div class="wizard-footer">
	                            	<div class="pull-right">
	                                    <input type='button' class='btn btn-next btn-fill btn-danger btn-wd' name='next' value='Next' />
	                                    <input type='button' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Finish' />
	                                </div>
	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />

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
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/open/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/open/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/open/js/jquery.bootstrap.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="${pageContext.request.contextPath}/resources/open/js/material-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="${pageContext.request.contextPath}/resources/open/js/jquery.validate.min.js"></script>
<script>
window.onload = function(){
	document.getElementById("openTime").setAttribute("required", "");
	document.getElementById("closeTime").setAttribute("required", "");
	document.getElementById("tourLocation").setAttribute("required", "");
};
</script>
</html>