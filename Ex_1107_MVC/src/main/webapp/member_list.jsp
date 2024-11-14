<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function del( idx ){
	            if( !confirm("정말 삭제하시겠습니까?")){
	               return;
	            }
	            
	            let url="member_del.do";
	            let param="idx="+idx;
	            
	            sendRequest(url,param,delFn,"get");
	            
	            
	         }
	         
	         function delFn(){
	            if( xhr.readyState ==4 && xhr.status ==200){
	            	let data = xhr.responseText;
	            	
	            	// 문자열 data를 실제 제이슨 구조로 변경
	            	let json = (new Function('return ' + data))();
	            	
	            	if( json[0].param == "yes" ){
	            		alert("삭제 성공")
	            	}
	            	else{
	            		alert("삭제 실패")
	            	}
	            	
	            	//전체목록 갱신
	            	location.href='member_list.do';
	            }
	         }
	         
		</script>
	</head>
	<body>
		<table border="1">
			<caption>:::회원목록:::</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>이미지</th>
				<th colspan="2">비고</th>
			</tr>
			<c:forEach var="vo" items="${list}" >
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.name}</td>
					<td>${vo.id}</td>
					<td>${vo.pwd}</td>
					<td>${vo.email}</td>
					<td>${vo.addr}</td>
					<td><img src="upload/${vo.filename}" width="80"></td>
					
					<td><input type="button" value="수정" onclick="location.href='member_select_one.do?idx=${vo.idx}'"></td>
					<td><input type="button" value="삭제" onclick="del(${vo.idx})"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="9"><input type="button" value="회원가입" onclick="location.href='member_insert_form.jsp'"></td>
			</tr>
		</table>
	</body>
</html>