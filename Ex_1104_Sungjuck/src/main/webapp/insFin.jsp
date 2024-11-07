<%@page import="dto.SungDTO"%>
<%@page import="dao.SungDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	SungDTO dto = new SungDTO();
	dto.setName(name);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	
	SungDAO dao = SungDAO.getInstance();
	dao.insert(dto);
	
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