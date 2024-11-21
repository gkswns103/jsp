<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	width: 500px;
}
a{text-decoration: none;}
</style>
</head>
<body>
	<c:forEach var="vo" items="${list}">
		<form>
		<input name="c_idx" value="${vo.c_idx}" type="hidden">
		<input name="pwd" value="${vo.pwd}" type="hidden">
			<hr>
			<pre>${vo.content }</pre>
			작성자:${vo.name}( ${vo.ip } )
			
			<div style="margin-top:5px">
				비밀번호 <input type="password" name="pwd2">
				<input type="button" value="삭제" onclick="del_comment(this.form);">
			</div>
		</form>
	</c:forEach>
	<div style="margin-top: 5px">
		${pageMenu}
	</div>
</body>
</html>