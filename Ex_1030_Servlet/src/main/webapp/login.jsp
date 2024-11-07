<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script>
		function send(f) {
			let id = f.id.value;
			if(id == ""){
				alert("아이디를 입력하세요");
				return;
			}
			
			let pwd = f.pwd.value;
			if(pwd == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			f.action = "login.do";
			f.method ="GET";
			f.submit();
		}
	</script>
	</head>
	<body>
		<form>
			<input name="id" placeholder="input id"><br>
			<input type="password" name="pwd" placeholder="input password"><br>
			
			<input type="checkbox" name="hobby" value="music">음악감상<br>
			<input type="checkbox" name="hobby" value="movie">영화감상<br>
			<input type="checkbox" name="hobby" value="game">게임<br>
			
			<input type="button" value="확인" onclick="send(this.form)">
		</form>
	</body>
</html>