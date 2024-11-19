<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send_check() {
				let f = document.f;
				
				if( f.subject.value == '' ){
					alert("제목 적어 새캬");
					return;
				}
				
				if( f.name.value == '' ){
					alert("이름 적어 새캬");
					return;
				}
				
				if( f.content.value == '' ){
					alert("내용 적어 새캬");
					return;
				}
				
				if( f.pwd.value == '' ){
					alert("비밃너호");
					return;
				}
				
				f.action = "reply.do";
				f.method = "post";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="f">
			<input type="hidden" name="idx" value="${param.idx}">
			<table width="700">
				<caption>댓글 작성하기</caption>
				<tr>
					<td><img src="img/td_bg_01.gif"></td>
					<th width="120">제목</th>
					<td><img src="img/td_bg_01.gif"></td>
					<td><input name="subject"></td>
				</tr>
		
				<tr>
					<td><img src="img/td_bg_01.gif"></td>
					<th width="120">작성자</th>
					<td><img src="img/td_bg_01.gif"></td>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<td><img src="img/td_bg_01.gif"></td>
					<th width="120">내용</th>
					<td><img src="img/td_bg_01.gif"></td>
					<td><textarea name="content" rows="10" cols="80" style="resize:none"></textarea></td>
				</tr>
				
				<tr>
					<td><img src="img/td_bg_01.gif"></td>
					<th width="120">비밀번호</th>
					<td><img src="img/td_bg_01.gif"></td>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="5" align="right">
						<img src="img/btn_back.gif" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>