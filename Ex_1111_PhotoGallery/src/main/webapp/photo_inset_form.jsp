<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
				let title = f.title.value;
				let pwd = f.pwd.value;
				let photo = f.photo.value;
				
				if( title == "" ){
					alert("제목을 입력하세요");
					return;
				}
				if( pwd == "" ){
					alert("비밀번호를 입력하세요");
					return;
				}
				if( photo == ""){
					alert("등록할 사진을 선택하세요");
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<form action="insert.do" method="post" enctype="multipart/form-data">
		
			<table border="1" align="center">
				<caption>사진 등록</caption>
				<tr>
					<th>제목</th>
					<td><input name="title"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<th>업로드할 사진</th>
					<td><input type="file" name="photo"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="send(this.form)">
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>