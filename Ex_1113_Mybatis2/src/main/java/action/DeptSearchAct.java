package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDAO;
import vo.DeptVO;

@WebServlet("/search_name.do")
public class DeptSearchAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String dname = request.getParameter("dname");
		
		List<DeptVO> list = DeptDAO.getInstance().select(dname);
		
		request.setAttribute("list",list);
		
		// Ajax로 요청된 페이지지만 포워딩으로 페이지 호출
		RequestDispatcher disp = request.getRequestDispatcher("dept_search_list.jsp");
		
		disp.forward(request, response);
	}

}
