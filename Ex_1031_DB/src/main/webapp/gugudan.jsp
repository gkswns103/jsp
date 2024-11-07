<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		td{
			padding: 10px 20px;
		}
	</style>
	</head>
	<body>
	<table border=1 style="border-collapse: collapse; font-size: 10px;">
		<caption>구구단</caption>
		<% for(int i =1; i < 10; i++){ %>
			<tr>
			<% for(int j= 2; j <10; j++){ %>
				<td><%=j%> * <%=i%> = <%=j*i %></td>
			<% } %>
			</tr>
		<% } %>
	</table>						
	</body>
</html>