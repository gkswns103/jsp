<%@page import="dao.SungDAO"%>
<%@page import="dto.SungDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	SungDAO dao = SungDAO.getInstance();
    	dao.delete(no);
    	
    	response.sendRedirect("sung.jsp");
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