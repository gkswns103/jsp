package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/insert.do")
public class MemberInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		int res = MemberDAO.getInstance().insert(vo);

		String param ="no";
		
		if(res > 0) {
			param = "yes";
		}
		response.getWriter().println(param);
	}

}
