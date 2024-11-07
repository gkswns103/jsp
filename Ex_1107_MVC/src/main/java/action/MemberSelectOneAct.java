package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member_select_one.do")
public class MemberSelectOneAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberVO vo = MemberDAO.getInstance().selectOne(idx);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("member_update_form.jsp");
		disp.forward(request, response);
	}

}
