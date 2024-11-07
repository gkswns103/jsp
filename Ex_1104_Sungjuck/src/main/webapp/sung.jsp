<%@page import="dto.SungDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SungDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SungDAO dao = SungDAO.getInstance();
	List<SungDTO> sung_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function sj_update( no, name, kor, eng, mat ) {
				let f = document.getElementById("ff");
				f.no.value = no;
				f.name.value = name;
				f.kor.value = kor;
				f.eng.value = eng;
				f.mat.value = mat;
				
				f.action = "updForm.jsp";
				f.method = "get";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form id="ff">
			<input type="hidden" name ="no">
			<input type="hidden" name ="name">
			<input type="hidden" name ="kor">
			<input type="hidden" name ="eng">
			<input type="hidden" name ="mat">
			
			<table border=1 style="border-collapse: collapse;">
			<caption>학생정보</caption>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>총점</th>
					<th>평균</th>
					<th>등수</th>
					<th colspan="2">비고</th>
				</tr>
				<% for( SungDTO dto : sung_list ) { %>
					<tr>
						<td><%=dto.getNo() %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getKor() %></td>
						<td><%=dto.getEng() %></td>
						<td><%=dto.getMat() %></td>
						<td><%=dto.getTot()%></td>
						<td><%=dto.getAvg() %></td>
						<td><%=dto.getRank() %></td>
						<td><input type="button" value="수정" onclick="sj_update('<%=dto.getNo()%>','<%=dto.getName()%>','<%=dto.getKor()%>','<%=dto.getEng()%>','<%=dto.getMat()%>');"></td>
						<td><input type="button" value="삭제" onclick="location.href='delFin.jsp?no=<%=dto.getNo() %>'"></td>
					</tr>
				<% } %>
				
				<tr>
					<td colspan="10" align="right"><input type="button" value="학생추가" onclick="location.href='insForm.jsp'"></td>
				</tr>
			</table>
		</form>
	</body>
</html>