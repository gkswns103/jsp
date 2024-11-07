<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="dao.SungDAO"%>
<%@page import="dto.SungDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	// 파라미터로 받은 정보들을 DTO로 저장
	SungDTO dto = new SungDTO();
	dto.setNo(no);
	dto.setName(name);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	
	// DTO를 DAO에게 전달
	SungDAO dao = SungDAO.getInstance();
	int res = dao.update(dto);
	
	// 수정이 완료되었으므로 sung.jsp로 이동해야함
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