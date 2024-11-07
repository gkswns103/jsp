<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		MemberDTO dto = new MemberDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		dto.setAddr(addr);
		
		int res = MemberDAO.getInstance().update(dto);
		
		response.sendRedirect("member_list.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>