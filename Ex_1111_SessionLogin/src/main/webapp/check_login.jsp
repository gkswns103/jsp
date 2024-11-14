<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 세션에 담아둔 user가 비어있으면 로그인 정보가 없다는 의미 -->
    
    <c:if test="${empty sessionScope.user}">
    	<script>
    		alert("로그인 후 이용하세요");
    		location.href='login_form.jsp';
    	</script>
    </c:if>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	</body>
</html>