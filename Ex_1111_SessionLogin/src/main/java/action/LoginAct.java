package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/login.do")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println("id: " + id +"/ pwd:" + pwd);
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String msg = "";
		
		if(vo != null) {
			// 회원있음
			if(vo.getPwd().equals(pwd)) {
				// 비밀번호 일치
				msg = "yes";
			}
			else {
				// 비밀번호 불일치
				msg = "pwd";
			}
		}
		else {
			// 회원없음
			msg = "id";
		}
		
		// 유저 정보(vo)를 세션스코프에 저장
		// 세션은 서버의 메모리(ram)을 사용하기 때문에 많이 사용할수록 브라우저를
		// 느리게 만들고 그에따른 비용상을 유발하기 떄문에 꼭 필요한 곳에서만
		// 사용해야 한다.!
		HttpSession session = request.getSession();
		session.setAttribute("user",vo);
		
		// 세션 유지시간 1시간으로 변경 (디폴트:30분)
		session.setMaxInactiveInterval(3600);
		
		response.getWriter().println(msg);
		
	}

}
