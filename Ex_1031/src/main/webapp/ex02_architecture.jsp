<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    	//선언부 : 변수나 메서드를 전역 형태로 정의하는 영역
    	int n = 0;
    
    	Random rnd = new Random();
    	
    	public int plus(int a, int b){
    		return a + b;
    	}
    %>
    
    <%
    	//스크립트 릿 영역의 변수들은 지역변수 개념으로 페이지가 새로고침 되면 초기화
    	int random = rnd.nextInt(10) + 1;
    	System.out.println(random);
    	
    	int n2 = 0;
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		n : <%=n++ %>
		n2 : <%=n2++ %>
	</body>
</html>