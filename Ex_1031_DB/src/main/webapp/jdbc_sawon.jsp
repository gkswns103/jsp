<%@page import="java.util.ArrayList"%>
<%@page import="dto.SawonDTO"%>
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
	
	String sql ="SELECT * FROM sawon";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonDTO> sawon_list = new ArrayList<SawonDTO>();
	
	
	while(rs.next()){
		SawonDTO dto = new SawonDTO();
		dto.setSabun(rs.getInt("sabun"));
		dto.setSaname(rs.getString("saname"));
		dto.setSagen(rs.getString("sagen"));
		dto.setDeptno(rs.getInt("deptno"));
		dto.setSajob(rs.getString("sajob"));
		dto.setSahire(rs.getString("sahire"));
		dto.setSamgr(rs.getInt("samgr"));
		dto.setSapay(rs.getInt("sapay"));
		
		sawon_list.add(dto);
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
			<caption>사원정보</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>부서번호</th>
					<th>직급</th>
					<th>입사날짜</th>
					<th>상사번호</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody>
				<% for( SawonDTO sawon : sawon_list ){ %>
					<tr>
						<td><%=sawon.getSabun() %></td>
						<td><%=sawon.getSaname() %></td>
						<td><%=sawon.getSagen() %></td>
						<td><%=sawon.getDeptno() %></td>
						<td><%=sawon.getSajob() %></td>
						<td><%=sawon.getSahire() %></td>
						<td><%=sawon.getSamgr() %></td>
						<td><%=sawon.getSapay() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</body>
</html>