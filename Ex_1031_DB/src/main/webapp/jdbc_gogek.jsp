<%@page import="java.util.ArrayList"%>
<%@page import="dto.GogekDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	InitialContext ic = new InitialContext(); // JNDI 검색
	
	Context ctx = (Context)ic.lookup("java:comp/env"); // Resource 위치 검색
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test"); //Resource 파일 접속
	
	Connection conn = dataSource.getConnection(); //DB객체 생성
	
	String sql = "SELECT gobun, goname, goaddr, gojumin FROM gogek"; //검색 쿼리문작성
	
	PreparedStatement pstmt = conn.prepareStatement(sql); //명령처리 객체
	
	ResultSet rs = pstmt.executeQuery(); //쿼리문을 수행후 데이터를 가져올 객체
	
	List<GogekDTO> gogek_list = new ArrayList<GogekDTO>(); //DTO를 저장할 리스트
	
	while( rs.next() ){
		GogekDTO dto = new GogekDTO();
		dto.setGobun(rs.getInt("gobun"));
		dto.setGoname(rs.getString("goname"));
		dto.setGoaddr(rs.getString("goaddr"));
		dto.setGojumin(rs.getString("gojumin"));
		
		gogek_list.add(dto);
	}
	conn.close();
	pstmt.close();
	rs.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border=1 style="border-collapse: collapse;">
			<caption>고객정보</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>주민번호</th>
				</tr>
			</thead>
			<tbody>
				<% for( GogekDTO gogek : gogek_list ){ %>
					<tr>
						<td><%=gogek.getGobun() %></td>
						<td><%=gogek.getGoname() %></td>
						<td><%=gogek.getGoaddr() %></td>
						<td><%=gogek.getGojumin() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</body>
</html>