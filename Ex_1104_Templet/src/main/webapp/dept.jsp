<%@page import="java.util.ArrayList"%>
<%@page import="dto.DeptDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	DeptDAO dao = DeptDAO.getInstance();
	List<DeptDTO> dept_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1>
			<caption>부서목록</caption>
				<tr>
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
				</tr>
			<% for(DeptDTO dto : dept_list){ %>
				<tr>
					<td><%=dto.getDeptno() %></td>
					<td><%=dto.getDname() %></td>
					<td><%=dto.getLoc() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>