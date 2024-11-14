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
	           if( !confirm("정말 수정하시겠습니까?")){
	               return;
	            }
	            
	            let url="member_update.do";
	            
	            //encodeURIComponent() : 특수문자가 들어가 있는 경우
	            // 파라미터 전달에 문제가 생기지 않도록 인코딩하는 함수
	            let param="idx="+f.idx.value+"&"+"id="+f.id.value+"&"+"pwd="+encodeURIComponent( f.pwd.value )+"&"+"name="+f.name.value+"&"+"email="+f.email.value+"&"+"addr="+f.addr.value + "&photo=" + f.photo.value;
	            sendRequest(url,param,updFn,"POST");
		}
         
         function updFn(){
            if( xhr.readyState ==4 && xhr.status ==200){
            	let data = xhr.responseText.trim();
            	if( data === 'yes' ){
            		alert("수정 성공");
            	}
            	else{
            		alert("수정 실패");
            	}
            	
            	//전체목록 갱신
            	location.href='member_list.do';
            }
         }
         
	</script>
	</head>
	<body>
		<form enctype="multipart/form-data">
			<input name="idx" type="hidden" value="${vo.idx}">
			<table border="1" style="border-collapse: collapse;">
				<caption>::: 회원정보 수정 :::</caption>
				<tr>
					<th>이름</th>
					<td><input name='name' value="${vo.name}"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name='id' value="${vo.id}"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name='pwd' value="${vo.pwd}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name='email' value="${vo.email}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name='addr' value="${vo.addr}"></td>
				</tr>
				<tr>
					<th>첨부</th>
					<td><input type="file" name='photo'"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정하기" onclick="send(this.form)">
						<input type="button" value="이전" onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>