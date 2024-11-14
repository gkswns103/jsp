<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* 테이블에 스타일을 지정해두지 않으면 나중에 display none, block으로 변경하는 과정에서 모양이 틀어지기 때문에
	미리 스타일을 적용하여 문제를 방지 */
	table{
		width: 300px;
		border-collapse: collapse;
		border:0 solid black;
	}
	
	td{
		width: 100px;
	}
</style>

<script src="js/httpRequest.js"></script>
<script>
	function send(f) {

		let dname = f.dname.value;

		if (dname === "") {
			document.getElementById("ori_table").style.display = 'block';
			document.getElementById("comment_disp").style.display = 'none';
			
			return;
		}
		sendRequest("search_name.do","dname=" + dname, resultFn, "get");
	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById("comment_disp").style.display = 'block';
			document.getElementById("comment_disp").innerHTML = xhr.responseText;
			
			document.getElementById("ori_table").style.display = 'none';
		}
	}
</script>
</head>
<body>
	<form>
		<input name="dname"> <input type="button" value="검색"
			onclick="send(this.form)">
		<table border="1" id="ori_table">
			<caption>::: 부서목록 :::</caption>
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.deptno}</td>
					<td>${vo.dname}</td>
					<td>${vo.loc}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<!-- 검색결과 -->
	<div id="comment_disp"></div>
</body>
</html>