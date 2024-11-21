<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/comm_style.css">
		
		<style>
			th{
				width: 150px;
			}
		</style>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
		
			/* 보고있는 댓글의 페이지 번호를 저장할 변수 */
			let comm_page = 1;
		
			/*상세보기 페이지로 오면 원래 등록되어 있던 댓글을 보여준다*/
			window.onload = function() {
				comment_list(comm_page);
			}
			
			function comment_list(page){
				
				comm_page = page;
				
				let url = "comment_list.do";
				let param = "idx=${param.idx}&page=" + page;
				
				sendRequest(url,param,comm_list_fn,"post");
			}
			
			function comm_list_fn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					let comment_disp = document.getElementById("comment_disp");
					comment_disp.innerHTML = data;
				}
			}
			
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
			
			function send(f) {
				let name = f.name.value;
				let content = f.content.value;
				let pwd = f.pwd.value;
				
				if( name == "" || content == "" || pwd == ""){
					alert("빈칸있음");
					return;
				}
				
				let url = "comment_insert.do";
				let param = "idx=${param.idx}&name=" + name + "&content=" + encodeURIComponent(content) + "&pwd=" + encodeURIComponent(pwd);
				
				sendRequest(url,param,comm_result,"POST");
			}
			
			function comm_result() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					let json = (new Function('return '+data))();
					if( json[0].result == 'yes' ){
						//댓글목록 요청
						comment_list(comm_page);
					}
					else{
						alert("등록실패");
					}
				}
			}
			
			function del_comment(f) {
				if( f.pwd.value != f.pwd2.value){
					alert("비밀번호 다름");
					return;
				}
				
				if( !confirm("삭제할거?") ){
					return;
				}
				
				let url = "comment_del.do";
				let param = "c_idx=" + f.c_idx.value;
				
				sendRequest(url,param,comm_list_del,"POST");
			}
			
			function comm_list_del() {
				if( xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					let json = (new Function('return ' + data))();
					if(json[0].result == "yes"){
						comment_list(comm_page);
					}
					else{
						alert("삭제 실패");
					}
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
		
		<div id="comment_form">
			<form>
				<table border="1" width="500">
					<tr>
						<th>작성자</th>
						<td><input name="name"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" rows="5" cols="30"></textarea></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input name="pwd" type="password">
							<input type="button" value="댓글등록" onclick="send(this.form)">
						</td>
					</tr>
				</table>
			</form>		
		</div>
		
		<div id="comment_disp">
			
		</div>
		
	</body>
</html>