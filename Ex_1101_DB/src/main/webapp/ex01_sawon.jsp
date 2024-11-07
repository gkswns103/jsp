<%@page import="java.util.ArrayList"%>
<%@page import="DTO.SawonDTO"%>
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
	String deptno = request.getParameter("deptno");

	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "SELECT * FROM sawon WHERE deptno=" + deptno;
	
	PreparedStatement pstm = conn.prepareStatement(sql);
	
	ResultSet rs = pstm.executeQuery();
	
	List<SawonDTO> sawon_list = new ArrayList<SawonDTO>();
	
	while( rs.next() ){
		SawonDTO dto = new SawonDTO();
		
		dto.setDeptno(rs.getInt("deptno"));
		dto.setSabun(rs.getInt("sabun"));
		dto.setSaname(rs.getString("saname"));
		dto.setSajob(rs.getString("sajob"));
		
		sawon_list.add(dto);
		
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
			<caption>사원목록</caption>
			<tr>
				<th>부서번호</th>
				<th>사번</th>
				<th>이름</th>
				<th>직책 이름</th>
			</tr>
			<% for(SawonDTO sawon : sawon_list){ %>
				<tr>
					<td><%=sawon.getDeptno() %></td>
					<td><%=sawon.getSabun() %></td>
					<td><a href="ex01_gogek.jsp?sabun=<%=sawon.getSabun()%>&saname=<%=sawon.getSaname()%>" ><%=sawon.getSaname() %></a></td>
					<td><%=sawon.getSajob() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>