<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script>
		function send(f) {
			f.method = "GET";
			f.submit();
		}
	</script>
	</head>
	<body>
		<form action="greet.do">
			<input name="id" placeholder="당신의 아이디를 입력하세요"><br>
			<input type="radio" name="nation" value="kor">한국<br>
			<input type="radio" name="nation" value="eng">미국<br>
			<input type="radio" name="nation" value="jpn">일본<br>
			<input type="radio" name="nation" value="chn">중국<br>
			<input type="button" value="확인" onclick="send(this.form)">
		</form>
	</body>
</html>	