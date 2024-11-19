<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		function checkData(f){
			/* 유효성 체크 */
			let category =f.category.value.trim();
			let p_price = f.p_price.value;
			let p_saleprice=f.p_saleprice.value;
			
			if(category===''){
				alert("카테고리를 선택하세요");
				return;
			}
			
			
			let regNumber = /^[0-9]*$/;
			if(!regNumber.test(p_price)){
				alert("가격은 숫자(정수)만 입력가능합니다.");
				return;
			 }
			
			
			if(!regNumber.test(p_saleprice)){
				alert("가격은 숫자(정수)만 입력가능합니다.");
				return;
			 }
			if(p_price<p_saleprice){
				alert("할인가가 원가보다 비쌀수 없습니다.");
				return;
			}
			
			let p_num= f.p_num.value.trim();
			let p_name=f.p_name.value.trim();
			let p_company=f.p_company.value.trim();
			let p_image_s=f.p_image_s.value.trim();
			let p_image_l=f.p_image_l.value.trim();
			
			if(p_num==""||p_name==""||p_company==""||
					p_image_s==""||p_image_l==""||p_price==""||p_saleprice==""){
				alert("제품 정보를 입력하세요")
				return;	
			} 
			f.submit();
		}
		</script>
		
	</head>
	<body>
		<form method="POST" enctype="multipart/form-data" action="updateFin.do">
			
			<input type="hidden" value="${vo.p_image_s }" name="small">
			<input type="hidden" value="${vo.p_image_l }" name="large">
			<input type="hidden" value="${vo.idx }" name="idx">
			
			<table border="1" width="600" align="center" style="border-collapse: collapse">
				<caption>상품 수정하기</caption>
				<tr>
					<td>제품 카테고리</td>
					<td>
						<select name="category">
							<option value="">카테고리를 선택하세요</option>
							<option value="com001">컴퓨터</option>
							<option value="ele002">가전제품</option>
							<option value="sp003">스포츠</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>모델명</td>
					<td><input name="p_num" value="${vo.p_num}"></td>
				</tr>
				
				<tr>
					<td>제품이름</td>
					<td><input name="p_name" value="${vo.p_name}"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input name="p_company" value="${vo.p_name}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input name="p_price" value="${vo.p_price}"></td>
				</tr>
				<tr>
					<td>할인가</td>
					<td><input name="p_saleprice" value="${vo.p_saleprice}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">제품설명</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<textarea name="p_content" rows="5" cols="50" style="resize:none" >${vo.p_content}</textarea>
					</td>
				</tr>
				<tr>
					<td>작은사진
					<img src="images/${vo.p_image_s }" width="50">
					</td>
					<td><input type="file" name="p_image_s" value="${vo.p_image_s}"></td>
				</tr>
				<tr>
					<td>큰사진
					<img src="images/${vo.p_image_l }" width="50">
					</td>
					<td><input type="file" name="p_image_l" value="${vo.p_image_s}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정" onclick="checkData(this.form)"> 
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>

			</table>
		</form>
	
	</body>
</html>