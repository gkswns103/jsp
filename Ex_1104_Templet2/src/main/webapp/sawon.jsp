<%@page import="dto.SawonDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SawonDAO dao = SawonDAO.getInstance();
	List<SawonDTO> sawon_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1>
			<caption>사원목록</caption>
			<tr>
				<th>사번</th>
				<th>사원이름</th>
				<th>직급</th>
				<th>입사년도</th>
				<th>월급</th>
			</tr>
			<% for( SawonDTO dto : sawon_list ) {%>
				<tr>
					<td><%=dto.getSabun() %></td>
					<td><%=dto.getSaname() %></td>
					<td><%=dto.getSajob() %></td>
					<td><%=dto.getSahire() %></td>
					<td><%=dto.getSapay() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>