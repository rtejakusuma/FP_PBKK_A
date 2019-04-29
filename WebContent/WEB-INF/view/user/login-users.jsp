<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link href="<c:url value="/resources/login/images/icons/favicon.ico"/>" rel="icon">
	<link href="<c:url value="/resources/login/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/vendor/animate/animate.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/vendor/css-hamburgers/hamburgers.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/vendor/animsition/css/animsition.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/vendor/select2/select2.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/vendor/daterangepicker/daterangepicker.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/css/util.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/login/css/main.css"/>" rel="stylesheet">
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/backgr.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5">

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="User name">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>