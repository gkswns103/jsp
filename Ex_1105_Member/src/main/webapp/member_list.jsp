<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	MemberDAO dao = MemberDAO.getInstance();
	
	List<MemberDTO> member_list = new ArrayList<MemberDTO>();
	member_list = dao.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function del(idx) {
		if(confirm("진짜 삭제할겨?") == false){
			return;
		}
		
		location.href="delFin.jsp?idx=" + idx;
		
	}
	
	function modify( idx ) {
		location.href = 'modify_form.jsp?idx='+idx;
	}
</script>
</head>
<body>
	<form>
		<table border=1 style="border-collapse: collapse;">
			<caption>::회원목록::</caption>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>비고</th>
			</tr>
			<% for( MemberDTO dto : member_list ) {%>
				<tr>
					<td><%=dto.getIdx() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getPwd() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getAddr() %></td>
					<td>
						<input type="button" value="삭제" onclick="del('<%=dto.getIdx()%>')">
						<input type="button" value="수정" onclick="modify('<%=dto.getIdx()%>')">
					</td>
				</tr>
			<% } %>
			<tr>
				<td colspan="7"><input type="button" value="추가" onclick="location.href='insForm.jsp'"></td>
			</tr>
		</table>
		</form>
</body>
</html>