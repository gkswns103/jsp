<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link rel="stylesheet" href="css/login_page.css">
	</head>
	<body>
		<div class="container">
		  <!-- Sign In -->	
		  <div class="container__form container--signin">
		    <form action="login.do" method="post" class="form" id="form2">
		      <h2 class="form__title">Sign In</h2>
		      <c:if test="${errorMsg ne null}">
				<p style="color: red">${errorMsg}</p>
			  </c:if>
		      <input name="id" type="text" placeholder="학번" class="input" required/>
		      <input name="pwd" type="password" placeholder="비밀번호" class="input" />
		     <!--<a href="#" class="link">Forgot your password?</a> -->
		      <button type="submit" class="btn">로그인</button>
		    </form>
		  </div>
		  
			<!-- Sign Up -->
			<div class="container__form container--signup">
			  <form class="form" id="form1">
			    <h2 class="form__title">회원가입</h2>
			    
			    <!-- 사용자 이름 입력 필드와 중복확인 버튼을 감싸는 div로 묶어줌 -->
			    <div class="input-group">
			      <input id="id" name="id" type="text" placeholder="학번" class="input2" />
			      <input type="button" value="중복확인" class="btn2" onclick="id_check()" />
			    </div>
			    <input name="pwd" type="password" placeholder="비밀번호" class="input" />
			    <input name="name" placeholder="이름" class="input" />
			    <select name="major" class="pl">
			    	<option value="" selected>::학과::</option>
			    	<option value="정보통신학부">정보통신학부</option>
			    	<option value="컴퓨터공학부">컴퓨터공학부</option>
			    </select>
			    
			    <select name="grade" class="pl">
			    	<option value="" selected>::학년::</option>
			    	<option value="1">1학년</option>
			    	<option value="2">2학년</option>
			    	<option value="3">3학년</option>
			    	<option value="4">4학년</option>
			    </select>
			    
			    <button class="btn" onclick="register(this.form)">회원가입</button>
			  </form>
			</div>
		
		
		  <!-- Overlay -->
		  <div class="container__overlay">
		    <div class="overlay">
		      <div class="overlay__panel overlay--left">
		        <button class="btn" id="signIn">Sign In</button>
		      </div>
		      <div class="overlay__panel overlay--right">
		        <button class="btn" id="signUp">Sign Up</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<script src="js/id_check.js"></script>
		<script src="js/httpRequest.js"></script>
		<script src="js/login_page.js"></script>
	</body>
</html>