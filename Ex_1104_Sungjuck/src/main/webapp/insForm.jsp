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
				if(name == ''){
					alert("이름을 입력하세요");
					return;
				}
				let kor = f.kor.value;
				let num = /^[0-9]*$/;
				
				if( !num.test(kor) || kor == '' || kor < 0 || kor > 100){
					alert("0~100 사이의 정수를 입력하세요");
					return;
				}
				
				f.action = "insFin.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border=1>
				<caption>학생추가</caption>
					<tr>
						<th>이름</th>
						<td><input name="name"></td>
					</tr>
					<tr>
						<th>국어</th>
						<td><input name="kor"></td>
					</tr>
					<tr>
						<th>영어</th>
						<td><input name="eng"></td>
					</tr>
					<tr>
						<th>수학</th>
						<td><input name="mat"></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="button" value="등록" onclick="send(this.form)"> 
						<input type="button" value="취소" onclick="history.go(-1)"> 
						</td>
					</tr>
			</table>
		</form>
	</body>
</html>