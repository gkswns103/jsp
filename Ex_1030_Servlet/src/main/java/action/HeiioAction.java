package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// url-mapping : 서버에서 요청받은 url을 실행시켜주는 식별자
@WebServlet("/hello.do")
public class HeiioAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 서블릿(server + let) :
	 1) 서버에서 실행되는 서비스 객체
	 2) 웹 응용프로그램을 만드는 자바기술이며, 실행 결과값을 html구조로 돌려준다
	 3) html의 정적인 문제를 해결할 수 있다(서블릿은 동적으로 움직임)
	 4) 자바언어로 작성되어 있어 자바의 일반적인 특징을 모두 갖는다
	 5) 객체지향적이다.
	*/
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request : 요청처리객체(외부에서 들어온 값을 받는 역활)
		// response : 응답처리객체(최종 결과를 반환하는 객체)
		
		System.out.println("-- HelloAction 서블릿이 실행됨 --");
		//접속자의 ip를 가져오는 코드
		String ip = request.getRemoteAddr();
		System.out.println(ip + "님 접속 감지");
		
		// response를 통해 결과를 html구조를 출력
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("h1{color:red}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>");
		out.print(ip + "님 접속을 환영합니다");
		out.println("</h1>");
		out.println("</body>");
		out.println("</html>");
	}

}
