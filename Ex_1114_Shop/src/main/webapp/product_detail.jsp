<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		<script>
			function addCart(idx,m_idx){
				
				let url="cart_insert.do";
				let param="idx="+idx+"&m_idx="+m_idx;
				sendRequest(url,param,resultFn,'GET');
				
				
			}
			
			function resultFn(){
				
				if(xhr.readyState==4 && xhr.status==200){
					//[{'result':'%s'}]
					let data=xhr.responseText;
					
					let json=( new Function ('return '+data) ) ();
					
					if(json[0].result == 'no'){
						alert("이미 장바구니에 담긴 상품입니다.");
						return;
						
					}else if(json[0].result == 'fail'){
						alert("상품을 추가하는데 실패했습니다.")
						return;
					}else{
						alert("상품을 추가했습니다.")
						
						if(!confirm('장바구니로 이동?')){
							return;
						}
						location.href='cart_list.do';
					}
					
				}
			}
			
		</script>
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<table border="1" align="center" width="600" style='border-collapse:collapse;'>
			<tr>
				<td>카테고리</td>
				<td>${vo.category }</td>
			</tr>
			<tr>
				<td>모델명</td>
				<td>${vo.p_num }</td>
			</tr>
			<tr>
				<td>제품명</td>
				<td>${vo.p_name }</td>
			</tr>
			<tr>
				<td>제조사</td>
				<td>${vo.p_company }</td>
			</tr>
			<tr>
				<td>제품가격</td>
				<td>
					<fmt:formatNumber value="${ vo.p_price}"/>
					( 할인가 : <fmt:formatNumber value="${vo.p_saleprice }"/>원
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">제품설명</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<img src="images/${vo.p_image_l }" width="500"/> 
			</tr>
			
			<tr>
				<td colspan="2">${vo.p_content}</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="장바구니에 담기" onclick="addCart('${vo.idx}','${1}');">
					<input type="button" value="장바구니 보기" onclick="location.href='cart_list.do'">
				</td>
			</tr>
		
		</table>
		
		
		
	</body>
</html>