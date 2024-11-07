<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- 
			Ajax(Asynchronus Javascript & xml) : 비동기통신
			자바스크립트를 이용한 백그라운드 통신기술.
			하나의 웹페이지에서 변경사항이 발생한 특정한 일부분에 대해서만
			부분적 갱신을 가능하게 하는 기술
		 -->
		
		<!-- Ajax사용을 위한 js파일을 참조 -->
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send() {
				let dan = document.getElementById("dan").value;
				
				if( dan == "" ){
					alert("단을 입력하세요");
					return;
				}
				
				//Ajax로 파라미터를 요청하기
				let url = "gugu_ajax.jsp";
				let param = "dan=" + dan;
				sendRequest(url,param,resultFn,"get");
				
			}
			
			//콜백 메서드
			//Ajax로 요청한 url에서 처리가 끝나면
			//자동으로 호출되는 메서드
			function resultFn() {
				// xhr.readyState
				// 0 : 초기화 오류
				// 1,2,3 : 로딩중
				// 4 : 로드완료
				
				// xhr.status
				// 200 : 이상없음
				// 404 : 페이지 검색 실패
				// 500 : 데이터오류
				
				if( xhr.readyState == 4 && xhr.status == 200 ){
					// 도착한 데이터 받기
					let data = xhr.responseText;
					
					document.getElementById("disp").innerHTML = data;
				}
				
			}
		</script>
	</head>
	<body>
		단<input id="dan">
		<input type="button" value="확인" onclick="send()">
		
		<br>
		
		<div id="disp">
			
		</div>
	</body>
</html>