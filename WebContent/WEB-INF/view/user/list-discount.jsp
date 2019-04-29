<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Discount List</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="center-items">
	    <h2>Discount List</h2>
	    <div class="col-3-md" style="text-align: left; margin-bottom: 16px;">
	    	<button class="btn btn-primary"><a href="addUserForm">Add User</a></button>
	    </div>
	    <table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Description</th>
					<th scope="col">Discount_Value</th>
					<th scope="col">Start_Time</th>
					<th scope="col">End_Time</th>				
				</tr>
			</thead>
			<c:forEach var="discount" items="${discounts}">
				<tbody>
					<tr>
						<th style="width: 5%" scope="row">${discount.id}</th>
						<td style="width: 15%">${discount.description}</td>
						<td style="width: 15%">${discount.discountValue}</td>
						<td style="width: 15%">${discount.startTime}</td>
						<td style="width: 15%">${discount.endTime}</td>
					</tr>
				</tbody>
			</c:forEach>			
	    </table>
	    <button class="btn btn-primary"><a href="../home">Back home</a></button>
    </div>	
</body>
</html>