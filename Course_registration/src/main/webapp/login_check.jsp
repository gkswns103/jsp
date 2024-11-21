<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${empty student}">
		<script>
			alert("로그인을 해주세요");
			location.href='login_register.jsp';
		</script>
	</c:if>