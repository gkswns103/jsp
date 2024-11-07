<%@page import="java.util.ArrayList"%>
<%@page import="dto.DeptDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	// 톰캣이 참조할 자원(JNDI) 검색
	InitialContext ic = new InitialContext();
	
	//Resource의 위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//Resource파일로 접근
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결객체 생성
	Connection conn = dataSource.getConnection();
	
	System.out.println("--DB연결성공--");
	
	String sql = "SELECT * FROM dept";
	//명령처리 객체
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//쿼리문을 수행하여 얻어진 결과에서 데이터를 가져올 객체
	ResultSet rs = pstmt.executeQuery();
	
	List<DeptDTO> dept_list = new ArrayList<DeptDTO>();
	
	//검색결과 가져오기
	while(rs.next()){
		DeptDTO dto = new DeptDTO();
		
		//현재 rs가 접근해 있는 row의 컬럼값을 vo에 저장
		dto.setDeptno(rs.getInt("deptno"));
		dto.setDname(rs.getString("dname"));
		dto.setLoc(rs.getString("loc"));
		
		dept_list.add(dto);
	}
	
	//db접근에 관여한 객체들을 역순으로 닫는다.
	rs.close();
	pstmt.close();
	
	// 사용이 완료된 DB는 반드시 연결을 해제하여
	// 다른 사용자가 접속할 수 있도록 해야 한다
	conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<table border=1 style="border-collapse: collapse;">
		<caption>부서목록</caption>
		<thead>
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0; i < dept_list.size(); i++){ %>
				<tr>
					<td><a><%=dept_list.get(i).getDeptno() %></a></td>
					<td><%=dept_list.get(i).getDname() %></td>
					<td><%=dept_list.get(i).getLoc() %></td>
				</tr>
			<% } %>
		</tbody>
	</table>
	</body>
</html>