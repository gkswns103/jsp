<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="upd.do" method="post">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="search" value="${param.search}">
	<input type="hidden" name="search_text" value="${param.search_text}">
	<input type="hidden" name="idx" value="${vo.idx}">
		<table>
			<caption>게시물 수정하기</caption>
			<tr>
				<th>제목</th>
				<td><input name="subject" value="${vo.subject}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="name" value="${vo.name}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content">${vo.subject}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="button" value="뒤로하기" onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>