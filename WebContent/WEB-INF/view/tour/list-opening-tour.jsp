<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>List Open</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>	
</head>
<body>
	<c:forEach items="${opening}" var="open">
	${open.id}
	${open.day}
	${open.openTime}
	</c:forEach>
</body>
</html>