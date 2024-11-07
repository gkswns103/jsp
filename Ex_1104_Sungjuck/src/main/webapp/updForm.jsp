<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				if( f.name.value == "" ){
					alert("이름을 적으세요");
					return;
				}
				let kor = f.kor.value;
				let num_patt = /^[0-9]*$/;
				if( !num_patt.test(kor) ){
					alert("점수는 정수로 입력하세요");
					return;
				}
				
				if( kor == '' ){
					alert("점수를 입력하시오");
					return;
				}
				
				if( kor < 0 || kor > 100 ){
					alert("0 ~ 100사이의 값을 입력하세요");
					return;
				}
				
				f.action = "updFin.jsp";
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form>
		
			<input type="hidden" name="no" value="<%=no%>">
			
			<table border=1>
			<caption>:::학생정보 수정하기:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<th>국어</th>
					<td><input name="kor" value="<%=kor%>"></td>
				</tr>
				<tr>
					<th>영어</th>
					<td><input name="eng" value="<%=eng%>"></td>
				</tr>
				<tr>
					<th>수학</th>
					<td><input name="mat" value="<%=mat%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="확인" onclick="send(this.form)">
					<input type="button" value="이전" onclick="location.href='sung.jsp'"></td>
				</tr>
			</table>
		</form>
	</body>
</html>