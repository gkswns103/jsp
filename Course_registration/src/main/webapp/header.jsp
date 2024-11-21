
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/header.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" onclick="location.reload(); return false;">수강신청 시스템</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">수강신청</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">강의조회</a></li>
				</ul>
			</div>
		</div>
		<div class="d-flex justify-content-end align-items-center w-100">
			<!-- 타이머는 왼쪽에 위치 -->
			<div id="timer" class="text-primary fs-5 me-3">30:00</div>
			<!-- 회원 정보와 로그아웃 버튼을 오른쪽에 가로로 배치 -->
			<div class="d-flex align-items-center">
				<div class="d-flex flex-column me-3">
					<div id="student" class="px-3">${student.stuname}</div>
					<div id="major" class="px-3">${student.major}</div>
				</div>
				<a href="logout.do" class="btn btn-outline-danger px-3 py-2 me-3">로그아웃</a>
			</div>
		</div>
	</nav>
	<script src="js/header.js"></script>
</body>
</html>