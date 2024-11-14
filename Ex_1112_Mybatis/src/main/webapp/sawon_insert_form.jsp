<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1">
			<caption>::: 사원추가 :::</caption>
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input name="gen"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input name="deptno"></td>
			</tr>
			<tr>
				<th>직급</th>
				<td><input name="sajob"></td>
			</tr>
			<tr>
				<th>상사번호</th>
				<td><input name="samgr"></td>
			</tr>
			<tr>
				<th>연봉</th>
				<td><input name="sapay"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button onclick="send(this.form)">등록</button>
				<button type="button" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		function send(f) {
			let deptno = f.deptno.value;
			let samgr = f.samgr.value;
			let sapay = f.sapay.value;
			
			let no_pattern = /^[0-9]{1,3}$/;
			
			if(!no_pattern.test(deptno)){
				alert("부서번호는 정수로 입력하세요");
				return;
			}
			
			if(!no_pattern.test(samgr)){
				alert("매니저 번호는 정수로 입력하세요");
				return;
			}
			
			let pay_pattern = /^[0-9]{4,8}$/;
			
			if(!pay_pattern.test(sapay)){
				alert("연봉을 똑디 입력해라");
				return;
			}
			
			f.action = "sawon_insert.do";
			f.method = "post";
			f.submit();
		}
	</script>
</body>
</html>