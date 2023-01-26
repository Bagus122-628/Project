<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Community ABC JobPortal</title>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Font Icon CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<style type="text/css">
body {
	min-height: 100vh;
	background-color: #edf2f6;
}

.header-parent {
	background-color: white;
}
</style>
</head>
<body class="d-flex flex-column justify-content-between">
	<div class="header-parent">
		<header
			class="d-flex justify-content-between py-3 border-bottom container">
			<ul class="nav nav-pills">
				<c:if test="${ isAdmin }">
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/admin" class="nav-link"><i
							class="bi bi-pencil-square"></i></i> Dashboard</a></li>
				</c:if>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/home" class="nav-link"
					aria-current="page"><i class="bi bi-house-door-fill"></i> Home</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/profile/${currentUser.id}"
					class="nav-link"><i class="bi bi-person-fill"></i> Profile</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/search" class="nav-link"><i
						class="bi bi-search"></i> Search</a></li>
				<li class="nav-item"><a
					href="<%=request.getContextPath()%>/message" class="nav-link"><i
						class="bi bi-chat-left-text-fill"></i> Message</a></li>
			</ul>

			<ul class="nav nav-pills">
				<c:choose>
					<c:when test="${isOnline}">
						<li class="nav-item"><a href="profile/${currentUser.id}"
							class="nav-link "><i class="bi bi-person-circle"></i>
								${online}</a></li>
						<li class="nav-item"><a href="logout"
							class="btn btn-outline-danger"><i
								class="bi bi-box-arrow-left"></i> logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/login">Login</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/userform"
							class="nav-link active">Register</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</header>
	</div>