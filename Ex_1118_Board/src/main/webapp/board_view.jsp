<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			th{
				width: 150px;
			}
		</style>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function reply() {
				location.href='board_reply.jsp?idx=${param.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}';
			}
			
			function upd() {
				let c_pwd = document.getElementById("c_pwd").value;
				
				if( '${vo.pwd}' != c_pwd ){
					alert("비밀번호 틀림");
					return;
				}
				
				location.href="updform.do?idx=${vo.idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}";
			}
			
			function del() {
				let c_pwd = document.getElementById("c_pwd").value;
				
				if( '${vo.pwd}' != c_pwd ){
					alert("비밀번호 틀림");
					return;
				}
				
				if(!confirm("삭제할거냐?")){
					return;
				}
				
				let url = "del.do";
				let param = "idx=${vo.idx}";
				
				sendRequest(url,param,resultFn,"post");
			}
			
			function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					let json = (new Function('return '+data))();
					if( json[0].result == 'succ' ){
						alert("삭제성공");
					}else{
						alert("삭제실패");
					}
					location.href="list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}";
				}
			}
		</script>
	</head>
	
	<body>
		<table>
			
			<tr>
				<th>제목</th>
				<td>${vo.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre>${vo.content}</pre></td>
			</tr>
			<tr>
				<th>아이피</th>
				<td>${vo.ip}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.readhit}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${vo.regdate}</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="c_pwd">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<img src="img/btn_list.gif" onclick="location.href='list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}'">
					
					<c:if test="${vo.depth eq 0}">
						<img src="img/btn_reply.gif" onclick="reply();">
					</c:if>
					
					<img src="img/btn_modify.gif" onclick="upd();">
					
					<img src="img/btn_delete.gif" onclick="del();">
				</td>
			</tr>
		</table>
	</body>
</html>