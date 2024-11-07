<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String[] fruit_array = {"사과", "배", "참외", "오렌지","복숭아"};
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	과일목록
		<ul>
			<% for(int i=0; i<fruit_array.length; i++){ %>
				<li><%=fruit_array[i]%></li>
			<% } %>
		</ul>
	</body>
</html>