<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>::: ${sawon.saname}${sawon.sajob} 상세정보 :::</caption>	
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>성별</th>
			<th>부서번호</th>
			<th>직급</th>
			<th>입사날짜</th>
			<th>상사번호</th>
			<th>월급</th>
		</tr>
		<tr>
			<td>${sawon.sabun}</td>
			<td>${sawon.saname}</td>
			<td>${sawon.sagen}</td>
			<td>${sawon.deptno}</td>
			<td>${sawon.sajob}</td>
			<td>${fn:split(sawon.sahire,' ')[0]}</td>
			<td>${sawon.samgr}</td>
			<td>${sawon.sapay}</td>
		</tr>
	</table>
</body>
</html>