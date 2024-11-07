<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");

	//String id = request.getParameter("id");
	//String pw = request.getParameter("pw");

	String id = (String)request.getAttribute("id");
	String pw = (String)request.getAttribute("pw");

	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = 
			//"SELECT * FROM test";
			"INSERT INTO test VALUES('" + id + "','" + pw + "')";
			//"CREATE TABLE test(id NUMBER(2) primary key,pw NUMBER(5))";
	PreparedStatement pstm = conn.prepareStatement(sql);
	
	pstm.executeUpdate();
	
	//ResultSet rs = pstm.executeQuery();
	/*
	while(rs.next()){
		out.println(rs.getString("id"));
		out.println(rs.getString("pw"));
	}
	
	out.println(id);
	out.println(pw);
	*/
	pstm.close();
	conn.close();
	//rs.close();
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		페이지 이동완료
		<%=id %>
	</body>
</html>