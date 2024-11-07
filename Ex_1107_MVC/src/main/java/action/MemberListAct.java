package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member_list.do")
public class MemberListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Model2(MVC패턴) : 비즈니스 로직과 UI로직을 완전히 분리해서 작업하는 형태
		// M(Model) : DAO
		// V(View) : JSP
		// C(Controller) : Servlet
		
		List<MemberVO> list = MemberDAO.getInstance().selectList();
		
		// request 영역에 list객체를 바인딩
		request.setAttribute("list",list);
		
		// 저장한 list를 어떤 jsp에서 사용할 것인지 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
	}

}
