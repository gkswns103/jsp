<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function send(f) {
		f.action="sawon_update.do";
		f.method="post";
		f.submit();
	}
</script>
</head>

<body>
	<form>
		<input type="hidden" name="sabun" value="${vo.sabun}">
		<table border="1">
			<caption>::: 사원정보변경 :::</caption>
			<tr>
				<th>이름</th>
				<td><input name="saname" value="${vo.saname}"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input name="sagen" value="${vo.sagen}"></td>
			</tr>
			<tr>
				<th>상사번호</th>
				<td><input name="deptno" value="${vo.deptno}"></td>
			</tr>
			<tr>
				<th>직책</th>
				<td><input name="sajob" value="${vo.sajob}"></td>
			</tr>
			<tr>
				<th>입사날짜</th>
				<td><input name="sahire" value="${fn:split(vo.sahire,' ')[0]}"></td>
			</tr>
			<tr>
				<th>상사번호</th>
				<td><input name="samgr" value="${vo.samgr}"></td>
			</tr>
			<tr>
				<th>연봉</th>
				<td><input name="sapay" value="${vo.sapay}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="send(this.form)">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>