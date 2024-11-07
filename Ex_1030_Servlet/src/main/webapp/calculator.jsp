<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script>
		function cal(f) {
			
			if(f.num1.value == ""){
				alert("수1을 입력해라잉");
				return;
			}
			
			if(f.num2.value == ""){
				alert("수2을 입력해라잉");
				return;
			}
			
			f.submit();
		}
	</script>
	
	</head>
	<body>
		<form action="calc.do" method="POST">
			수1:<input name="num1" placeholder="정수입력"><br>
			수2:<input name="num2" placeholder="정수입력"><br>
			<input type="button" value="확인" onclick="cal(this.form)"><br>
		</form>
	</body>
</html>