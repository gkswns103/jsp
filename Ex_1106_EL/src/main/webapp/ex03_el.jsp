<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String,String> map = new HashMap<String,String>();
	map.put("user","test11");
	map.put("pwd","1234");
	map.put("email","aa@n.com");
	map.put("addr","서울특별시");
	
	request.setAttribute("my_map",map);
	
	PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(30);
	p1.setEmail("길동@n.com");
	
	PersonVO p2 = new PersonVO();
	p2.setName("김길동");
	p2.setAge(20);
	p2.setEmail("똥@n.com");
	
	request.setAttribute("my_vo",p1);
	
	List<PersonVO> list = new ArrayList<PersonVO>();
	list.add(p1);
	list.add(p2);
	
	request.setAttribute("list",list);
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%= map.get("user") %><br>
		user : ${requestScope.my_map.get("user") }<br>
		pwd : ${my_map.get("pwd") }<br>
		email : ${ my_map['email'] }<br>
		addr : ${ my_map.addr }<br>
		
		<hr>
		
		name = ${my_vo.name}<br>
		age = ${my_vo.age }<br>
		email = ${my_vo.email }<br>
		
		<hr>
		
		이름1 = ${list.get(0).name }<br>
		이메일1 = ${list[0].email }<br>
		나이1 = ${list[0].age }<br>
		
	</body>
</html>