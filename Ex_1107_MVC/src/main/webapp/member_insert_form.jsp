<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send(f) {
		           if( !confirm("가입하시겠습니까?")){
		               return;
		            }
		            
		            let url="insert.do";
		            let param="id="+f.id.value+"&"+"pwd="+f.pwd.value+"&"+"name="+f.name.value+"&"+"email="+f.email.value+"&"+"addr="+f.addr.value;
		            sendRequest(url,param,insFn,"POST");
			}
	         
	         function insFn(){
	            if( xhr.readyState ==4 && xhr.status ==200){
	            	let data = xhr.responseText.trim();
	            	if( data === 'yes' ){
	            		alert("가입 성공");
	            	}
	            	else{
	            		alert("가입 실패");
	            	}
	            	
	            	//전체목록 갱신
	            	location.href='member_list.do';
	            }
	         }
			
		</script>
	</head>
	<body>
		<form>
			<table border="1" style="border-collapse: collapse;">
				<caption>::: 회원가입 :::</caption>
				<tr>
					<th>아이디</th>
					<td><input name='id'></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name='pwd' type="password"></td>
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
					<td colspan="2" align="center">
						<input type="button" value="회원가입" onclick="send(this.form)">
						<input type="button" value="취소" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>