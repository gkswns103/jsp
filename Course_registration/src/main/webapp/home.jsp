<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/home.css" rel="stylesheet">

<script>
	function search_class() {
		let search_class = document.getElementById("search_class").value;

		location.href = 'classlist.do?search_class=' + search_class;
	}

	function applyClass(classIdx) {
		const row = document.getElementById("row-" + classIdx);
		
		const appliedTableBody = document.getElementById("appliedClassesBody");

		appliedTableBody.appendChild(row);

		const applyButton = row.querySelector("input[type='button']");
		
		applyButton.value = "취소";
		
		applyButton.classList.replace("btn-outline-secondary","btn-outline-danger");
		
		applyButton.onclick = function() {
			cancelClass(classIdx);
		};
	}

	function cancelClass(classIdx) {
		const row = document.getElementById("row-" + classIdx);
		
		const originalTableBody = document.querySelector("table tbody:not(#appliedClassesBody)");

		originalTableBody.appendChild(row);

		const cancelButton = row.querySelector("input[type='button']");
		
		cancelButton.value = "신청";
		
		cancelButton.classList.replace("btn-outline-danger","btn-outline-secondary");
		
		cancelButton.onclick = function() {
			applyClass(classIdx);
		};
	}
</script>


</head>
<body>
	<jsp:include page="login_check.jsp"></jsp:include>
	<div id="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="bodys">
		<div id="left">
			<div class="vertical-bar"></div>
		</div>
		<div id="right">
			<div class="container my-4 d-flex justify-content-center">
				<div class="row">
					<div class="col-md-8 d-flex justify-content-center">
						<input type="text" id="search_class" class="form-control mt-3"
							placeholder="교과목명" style="height: 35px; width: 100%;">
						<button class="btn btn-outline-primary ms-2 mt-3"
							style="height: 35px; width: 100px;" onclick="search_class()">검색</button>
					</div>
				</div>
			</div>
			<div class="table-container">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead class="table-light" align="center">
							<tr>
								<th>교과목번호</th>
								<th>교과목명</th>
								<th>담당교수</th>
								<th>개설학과</th>
								<th>교과구분</th>
								<th>학점</th>
								<th>시간</th>
								<th>신청</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach var="dto" items="${classlist}">
								<tr id="row-${dto.classidx}">
									<td>${dto.classidx}</td>
									<td>${dto.classname}</td>
									<td>${dto.classpro}</td>
									<td>${dto.makelesson}</td>
									<td>${dto.classdivision}</td>
									<td>${dto.classunit}</td>
									<td>${dto.classtime}</td>
									<td><input type="button"
										class="btn btn-outline-secondary btn-sm" value="신청"
										onclick="applyClass('${dto.classidx}')"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="table-container mt-5">
				<h4 style="position: sticky; top: 0; background-color: white; z-index: 1;">신청한 과목</h4>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead class="table-light" align="center">
							<tr>
								<th>교과목번호</th>
								<th>교과목명</th>
								<th>담당교수</th>
								<th>개설학과</th>
								<th>교과구분</th>
								<th>학점</th>
								<th>시간</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody id="appliedClassesBody" align="center">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>