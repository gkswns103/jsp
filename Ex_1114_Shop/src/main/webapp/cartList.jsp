<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<table border="1" align="center" width="600" style='border-collapse:collapse;'>
			<tr>
				<td colspan="6">:::내 장바구니:::</td>
			</tr>
			
			<tr bgcolor="#dedede">
				<th width="10%">모델명</th>
				<th width="25%">이미지</th>
				<th width="35%">제품명</th>
				<th width="15%">가격</th>
				<th width="15%">수량</th>
				<th width="15%">금액</th>
				<th width="15%">비고</th>
			</tr>
		
			<c:forEach var="vo" items="${list }">
			<tr align="center">
				<td>${vo.p_num }</td>
				<td>
					<img src="images/${vo.p_image_s }" width="100" height="90"/>
				</td>
				<td>${vo.p_name }</td>
				<td>
					<fmt:formatNumber value="${vo.p_saleprice }"/>원<br>
				</td>
				<td>
					<form action="">
						<input name="c_cnt" size="4" value="${vo.c_cnt }" >
						<input type="submit" value="수정" >
					</form>
				</td>
				
				<td>${ vo.c_cnt*vo.p_saleprice}</td>
				
				<td>
					<input type="button" value="삭제">
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${empty list }">
			<tr>
				<td colspan="7" align="center">
					장바구니가 비었습니다.
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td colspan="6" align="right">
					총 결제액
				</td>
				<td><fmt:formatNumber value="${total_amount }"/></td>
			</tr>
		</table>
	</body>
</html>