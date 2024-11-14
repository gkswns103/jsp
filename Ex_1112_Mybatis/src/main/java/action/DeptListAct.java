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

@WebServlet("/deptlist.do")
public class DeptListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<DeptVO> list = DeptDAO.getInstance().select();
		
		request.setAttribute("list",list);
		
		RequestDispatcher disp = request.getRequestDispatcher("dept_list.jsp");
		disp.forward(request, response);
		
	}

}
