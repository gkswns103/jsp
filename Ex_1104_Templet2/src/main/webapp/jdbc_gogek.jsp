<%@page import="dto.GogekDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.GogekDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	GogekDAO dao = GogekDAO.getInstance();
	List<GogekDTO> gogek_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1>
			<caption>고객목록</caption>
			<tr>
				<th>고객번호</th>
				<th>고객이름</th>
				<th>고객주소</th>
				<th>주민번호</th>
				<th>담당직원번호</th>
			</tr>
			<% for( GogekDTO dto : gogek_list ) {%>
				<tr>
					<td><%=dto.getGobun() %></td>
					<td><%=dto.getGoname() %></td>
					<td><%=dto.getGoaddr() %></td>
					<td><%=dto.getGojumin() %></td>
					<td><%=dto.getGodam() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>