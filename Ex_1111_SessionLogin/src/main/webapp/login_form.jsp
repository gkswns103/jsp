<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send( f ) {
				let id = f.id.value;				
				let pwd = f.pwd.value;
				if(id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				if(pwd == ""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				let url = "login.do";
				let param = "id=" + id + "&pwd=" + pwd;
				sendRequest(url,param,loginFn,"POST");
			}
			
			function loginFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data =  xhr.responseText.trim();
					if( data == "yes" ){
						location.href='main_content.jsp';
					}
					else if(data == "id"){
						alert("아이디가 없습니다.");
						return;
					}
					else{
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}
				}
			}
		</script>
	</head>
	
	<body>
		<form>
			<table border="1" align="center">
				<caption>::: 로그인 :::</caption>
					<tr>
						<th>아이디</th>
						<td><input name="id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input name="pwd" type="password"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="로그인" onclick="send(this.form)"></td>
					</tr>
			</table>
		</form>
		
		
	</body>
</html>