<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    /*
    EL(Expression Language) : JSP에서 사용하는 표현식을 좀 더 간결하게 사용할 수 있도록 해 주는 표현 언어
    
    ## EL로 값을 저장하고 불러오려면 JSP의 내장객체 4개 영역에 대해 알고있어야 함
    1) page 영역
		- 하나의 페이지에서만 값을 사용하고 공유할 수 있는 영역
	2) request 영역(가장 많이 사용되는 scope)
		- 지역개념으로 페이지가 닫히면 종료된다
		- 두 개의 페이지에서 값을 사용하고 공유할 수 있다.
	3) session 영역(두번째로 많이 사용되는 scope)
		- 전역개념으로 페이지가 닫혀도 브라우저가 완전히 종료되기 전까지는 남아있다.
		- 톰캣 실행과 함께 자동으로 만들어지는 영역
		- 하나의 웹 브라우저에서 사용중인 모든 페이지에 값을 공유할 수 있다.
	4) application 영역
		- 같은 프로젝트의 페이지에만 값을 공유할 수 있다.
    */
    
    String msg = "안녕";
	pageContext.setAttribute("msg1", msg);
	
	request.setAttribute("msg","안녕하세요");
	
	session.setAttribute("msg", "반가워요");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		EL표현식(파라미터) : ${ param.num }<br>
		EL표현식(pageScope) : ${ pageScope.msg }<br>
		EL표현식(requestScope) : ${ requestScope.msg }<br>
		EL표현식(sessionScope) : ${ sessionScope.msg }<br>
		EL표현식(영역생략) : ${ msg }<br>
		<!-- 생략식 사용시 영역 참조 순서
		1.pageScope
		2.requestScope
		3.sessionScope
		4.applicationScope -->
	</body>
</html>