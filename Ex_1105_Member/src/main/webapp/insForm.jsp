<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f) {
				
				let name = f.name.value;
				let id = f.id.value;
				let pwd = f.pwd.value;
				let email = f.email.value;
				let addr = f.addr.value;
				
				if( name =='' || id == '' || pwd == '' || email =='' || addr == ''){
					alert("빈칸이있습니다.")
					return;
				}
				
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form action="insFin.jsp" method="post">
			이름: <input name="name"><br>
			아이디: <input name="id"><br>
			비밀번호: <input name="pwd" type="password"><br>
			이메일: <input name="email"><br>
			주소: <input name="addr"><br>
			<input type="button" value="추가" onclick="send(this.form)">
		</form>
	</body>
</html>