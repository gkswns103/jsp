<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	a{
		text-decoration: none;
		color: black;
	}
</style>

</head>
<body>
	<table width="700" align="center">
		<tr>
			<td>
				<img src="img/title_04.gif">
			</td>
		</tr>
		
		<tr>
			<th width="50">번호</th>
			<td>
				<img src="img/td_bg_01.gif">
			</td>
			
			<th width="300">제목</th>
			<td>
				<img src="img/td_bg_01.gif">
			</td>
			
			<th width="90">작성자</th>
			<td>
				<img src="img/td_bg_01.gif">
			</td>
			
			<th width="90">작성일</th>
			<td>
				<img src="img/td_bg_01.gif">
			</td>
			
			<th width="60">조회수</th>
		</tr>
		
		<c:forEach var="vo" items="${list}">
			<tr>
				<td align="center">${vo.idx}</td>
				<td><img src="img/td_bg_01.gif"></td>

				<td>		
				<!-- 댓근은 들여쓰기 한다 -->
				<c:forEach begin="1" end="${vo.depth}">&nbsp;</c:forEach>
				
				<!-- 댓글 기호 표기 -->
				<c:if test="${vo.depth ne 0}">ㄴ</c:if>
					<c:if test="${vo.del_info ne -1}">	
						<a href="view.do?idx=${vo.idx}">${vo.subject}</a>
					</c:if>
					<c:if test="${vo.del_info eq -1 }">
						<font color=gray>이미 삭제된 게시글 입니다.</font>
					</c:if>
				</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td>
					${vo.name}<br>
					(${vo.ip})
				</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td>${vo.regdate}</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td align="center">${vo.readhit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="9" align="center">
				<img src="img/btn_prev.gif">
				
				<img src="img/btn_next.gif">
			</td>
		</tr>
		
		<tr>
			<td colspan="9" align="right">
				<!-- 새글 등록버튼 -->
				<img src="img/btn_reg.gif" style="cursor:pointer;" onclick="location.href='board_write.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>