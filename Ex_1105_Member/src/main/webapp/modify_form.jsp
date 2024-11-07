<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int idx = Integer.parseInt(request.getParameter("idx"));
    
    	MemberDTO dto = MemberDAO.getInstance().selectOne(idx);
    	
    	request.setAttribute("name",dto.getName());
    	request.setAttribute("id",dto.getId());
    	request.setAttribute("dto",dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function update(f) {
			f.action="modify_Fin.jsp";
			f.method="get";
			f.submit();
		}
	</script>
</head>
<body>
	<form>
		<input name="idx" type="hidden" value="<%=idx%>">
		<table>
			<caption>::회원 정보 수정::</caption>
			<tr>
				<td>이름</td>
				<td><input name="name" value="${name}"></td>
			</tr>
				
			<tr>
				<td>아이디</td>
				<td><input name="id" value="${id}"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input name="pwd" type="password" value="<%= dto.getPwd() %>"></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input name="email" value="<%= dto.getEmail() %>"></td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input name="addr" value="<%= dto.getAddr() %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="수정" onclick="update(this.form)"></td>
			</tr>
	</table>
	</form>
</body>
</html>