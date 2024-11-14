<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
		
			let check_btn = false;
		
			function send(f) {
		           if(!check_btn){
		        	   alert("아이디 중복체크를 먼저 하세요");
		        	   return;
		           }
		           if(!(f.pwd.value == f.pwd2.value)){
		        	   alert("비밀번호를 확인해주세요");
		        	   return;
		           }
		           if( !confirm("가입하시겠습니까?")){
		               return;
		            }
		           f.action = "insert.do";
		           f.method = "post";
		           f.submit();
			}

	         function check_id() {
				let id = document.getElementById("id").value;
				if(id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				
				let url = "check_id.do";
				let param = "id=" + id;
				
				sendRequest(url,param,resultFn,"GET");
			}
	         
	        function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					
					let json = (new Function('return ' + data))();
					
					alert(json[2].id + json[1].res);
					if(json[0].r == 1){
						check_btn = true;
					}
				}
			}
	        
	        function chk() {
				// 아이디 입력상자의 값이 변경되면 호출되는 메서드
				check_btn = false;
			}
		</script>
	</head>
	<body>
		<form enctype="multipart/form-data">
			<table border="1" style="border-collapse: collapse;">
				<caption>::: 회원가입 :::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input id="id" name='id' size="9" oninput="chk()">
						<input type="button" value="중복체크" onclick="check_id()">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name='pwd' type="password"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input name='pwd2' type="password"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name='name'></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name='email'></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name='addr'></td>
				</tr>
				<tr>
					<th>첨부</th>
					<td><input name='photo' type="file"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="회원가입" onclick="send(this.form)">
						<input type="button" value="취소" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>