<%@page import="java.util.ArrayList"%>
<%@page import="DTO.GogekDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sabun = request.getParameter("sabun"); // 사번
	String saname = request.getParameter("saname"); // 이름
	
	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "SELECT * FROM gogek WHERE godam=" + sabun;
	
	PreparedStatement pstm = conn.prepareStatement(sql);
	
	ResultSet rs = pstm.executeQuery();
	
	List<GogekDTO> gogek_list = new ArrayList<GogekDTO>();
	while(rs.next()){
		GogekDTO dto = new GogekDTO();
		
		dto.setGobun(rs.getInt("gobun"));
		dto.setGoname(rs.getString("goname"));
		dto.setGoaddr(rs.getString("goaddr"));
		
		gogek_list.add(dto);
	}
	
	rs.close();
	pstm.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1>
		<caption><%=saname %>사원의 고객정보</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
			<% for(GogekDTO gogek : gogek_list) {%>
				<tr>
					<td><%=gogek.getGobun() %></td>
					<td><%=gogek.getGoname() %></td>
					<td><%=gogek.getGoaddr() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>