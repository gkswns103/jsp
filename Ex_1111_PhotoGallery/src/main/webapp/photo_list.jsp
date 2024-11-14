<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/photo.css">
		
		<script src='js/httpRequest.js'></script>
		
		<script>
			function del(f) {
				let idx = f.idx.value;
				let pwd = f.pwd.value;
				let pwd2 = f.pwd2.value;
				
				if( pwd != pwd2 ){
					alert("비밀번호가 다릅니다");
					return;
				}
				
				if ( !confirm("정말 삭제할거임?") ){
					return;
				}
				
				let url = "photo_delete.do";
				let param = "idx=" + idx;
				
				sendRequest(url, param, resultFn, "POST");
			}
			
			function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					
					let json = (new Function('return ' + data))();
					
					if( json[0].param == "yes" ){
						alert("삭제성공");
					}
					else{
						alert("삭제실패");
					}
					
					location.href = 'list.do';
				}
			}
			
			let click = false;
			
			function imgclick( path ) {
				click = !click;
				
				let img = document.getElementById("showImg");
				let showdiv = document.getElementById("showdiv");
				
				if( click ){
					img.src = path;
					showdiv.style.display = "block";
				}
				else{
					showdiv.style.display = "none";
					img.src = "";
				}
			}
			
			function download( filename ) {
				location.href='download.do?dir=/upload/&filename=' + encodeURIComponent(filename);
			}
		</script>
	</head>
	
	<body>
		<div id="container">
			<div id="left_ad" style="margin:auto 0;">
				<iframe width="200" height="350" src="https://www.youtube.com/embed/Ff1qk7JoRVk?autoplay=1&mute=1&loop=1&playlist=Ff1qk7JoRVk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
		<div id="main_box">
			<h1>::: photo gallery :::</h1>
			<div align="center">
				<input type="button" value="사진등록" onclick="location.href='photo_inset_form.jsp'">
			</div>
			
			<div id="photo_box">
				<c:if test="${empty list}">
					<div>등록된 사진이없습니다.</div>
				</c:if>
				<c:forEach var="vo" items="${list}">
					<div class="photo_type">
						<img src="upload/${vo.filename}" onclick="imgclick(this.src)">
						<div class="title">${vo.title}</div>
						<form>
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="hidden" name="pwd" value="${vo.pwd}">
							<div align="center">
								<input type="password" name="pwd2" size="5"> 
								<input type="button" value="삭제" onclick="del(this.form)">
								<input type="button" value="down" onclick="download('${vo.filename}')">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
			<div id="right_ad" style="margin: auto 0;">
				<iframe width="200" height="350" src="https://www.youtube.com/embed/HRPFde0xgIw?autoplay=1&mute=1&loop=1&playlist=HRPFde0xgIw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
		</div>
			<div id="showdiv" style="display:none;">
				<img src="" id="showImg" onclick="imgclick(this.src)">
			</div>
	</body>
</html>