<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page="check_login.jsp"></jsp:include>
		${user.name}님 환영합니다<br>
		<button onclick="location.href='logout.do'">로그아웃</button>
		
	</body>
</html>