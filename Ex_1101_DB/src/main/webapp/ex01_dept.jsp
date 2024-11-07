<%@page import="java.util.ArrayList"%>
<%@page import="DTO.DeptDTO"%>
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
	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "SELECT * FROM DEPT";
	
	PreparedStatement pstm = conn.prepareStatement(sql);
	
	ResultSet rs = pstm.executeQuery();
	
	List<DeptDTO> dept_list = new ArrayList<DeptDTO>();
	
	while( rs.next()){
		DeptDTO dto = new DeptDTO();
		dto.setDeptno(rs.getInt("deptno"));
		dto.setLoc(rs.getString("loc"));
		dto.setDname(rs.getString("dname"));
		
		dept_list.add(dto);
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
			<caption>부서목록</caption>
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			<% for(DeptDTO dept : dept_list){ %>
				<tr>
					<td><%=dept.getDeptno()%></td>
					<td><a href="ex01_sawon.jsp?deptno=<%=dept.getDeptno()%>"><%=dept.getDname() %></a></td>
					<td><%=dept.getLoc() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>