<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int idx = Integer.parseInt(request.getParameter("idx"));
    
    	int res = MemberDAO.getInstance().delete(idx);
    	
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