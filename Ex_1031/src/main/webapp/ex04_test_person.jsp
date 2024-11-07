<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	List<PersonVO> pList = new ArrayList<PersonVO>();
	
	PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	PersonVO p2 = new PersonVO();
	p2.setName("박길동");
	p2.setAge(30);
	p2.setTel("010-222-2222");
	
	PersonVO p3 = new PersonVO();
	p3.setName("제갈길동");
	p3.setAge(40);
	p3.setTel("010-333-3333");
	
	PersonVO p4 = new PersonVO();
	p4.setName("똥길동");
	p4.setAge(50);
	p4.setTel("010-444-4444");
	
	PersonVO p5 = new PersonVO();
	p5.setName("퀭길동");
	p5.setAge(60);
	p5.setTel("010-555-5555");
	
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
	pList.add(p4);
	pList.add(p5);
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		table{
			border-collapse: collapse;
		}
		td{
			text-align: center;
		}
	</style>
	</head>
	<body>
		<table border=1>
			<caption>::: 개인정보 목록 :::</caption>
			<thead>
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<% for(int i=0; i < pList.size(); i++){ %>
					<tr>
						<td><%= pList.get(i).getName() %></td>
						<td><%= pList.get(i).getAge() %></td>
						<td><%= pList.get(i).getTel() %></td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</body>
</html>