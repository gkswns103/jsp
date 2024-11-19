<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			.regi{width:600px;
				  align:center;
				  text-align:right;
				  margin:10px auto;
				  } 
		</style>
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		
		<table align="center" width="600" border="1" style="border-collapse:collapse;">
		
			<caption>
				<c:if test="${list[0].category eq 'com001'}">:::컴퓨터 목록:::</c:if>
				<c:if test="${list[0].category eq 'ele002'}">:::가전제품 목록:::</c:if>
				<c:if test="${list[0].category eq 'sp003'}">:::스포츠용품 목록:::</c:if>
		<div class="regi">
			<input id="reg" type="button" value="상품등록" onclick="location.href='product_reg_form.jsp'">
		</div>
			</caption>
		
			<tr>
				<th width="10%">모델명</th>
				<th width="25%">이미지</th>
				<th width="35%">제품명</th>
				<th width="15%">가격</th>
				<th width="15%">비고</th>
			</tr>
			<!-- 해당 카테고리에 상품이 하나도 없는 경우  -->
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center">
				아직 등록된 상품이 없습니다
					</td>					
				</tr>
			</c:if>
			
			<c:forEach var="p" items="${list}">
				<tr align="center"> 
					<td>
						${p.p_num}<br>
						<input type="button" value="수정" onclick="location.href='updForm.do?idx=${p.idx}'">
						<br>
						<input type="button" value="삭제" onclick="location.href='productDel.do?idx=${p.idx}&category=${param.category}'">
					</td>
					<td>
						<img src="images/${p.p_image_s}" width="100" height="90">
					</td>
					<td>
						<a href="view.do?idx=${ p.idx }">${p.p_name}</a>
					</td>
					<td>
						<fmt:formatNumber value="${p.p_saleprice}"/>원<br>
						<font color="red">(${p.sale_rate }%)</font>
					</td>
					<td>
						원가<br><fmt:formatNumber value="${p.p_price}"/>원<br>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>