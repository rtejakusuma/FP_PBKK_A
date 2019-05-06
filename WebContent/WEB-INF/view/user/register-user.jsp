<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Register</title>
	<link href="<c:url value="/resources/register/images/icons/favicon.ico"/>" rel="icon">
	<link href="<c:url value="/resources/register/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/vendor/animate/animate.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/vendor/css-hamburgers/hamburgers.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/vendor/animsition/css/animsition.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/vendor/select2/select2.min.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/vendor/daterangepicker/daterangepicker.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/css/util.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/register/css/main.css"/>" rel="stylesheet">
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<c:url value="/resources/login/images/backgr.jpg"/>');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Registrasi <em>Pengguna</em> Baru
				</span>
				<form:form onsubmit="return checkPass(this)" action="saveUser" modelAttribute="user" method="POST" class="login100-form validate-form p-b-33 p-t-5">

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<form:input cssClass="input100" type="text" path="username" placeholder="Nama" />
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter email">
						<form:input cssClass="input100" type="text" path="email" placeholder="Email" />
						<span class="focus-input100" data-placeholder="&#x2709;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<form:input cssClass="input100" type="password" path="password" placeholder="Kata sandi" />
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password_confirm" placeholder="Konfirmasi Kata Sandi">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<form:input type="hidden" path="role" value="0" />
					
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Kirim
						</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/bootstrap/js/popper.js"/>"></script>
	<script src="<c:url value="/resources/register/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/daterangepicker/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/register/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/register/js/main.js"/>"></script></body>
	<!--===============================================================================================-->
	<script>
		function checkPass(form){
			var pass = form.password.value;
			var confirm = form.password_confirm.value;
			
			if(pass !== confirm || pass === null || confirm === null){
				form.password_confirm.focus();
				alert("Password Confiramtion Failed!")
				return false;
			}
			
			return true;
			
			
		}
	</script>
</html>