package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawon_insert.do")
public class SawonInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String gen = request.getParameter("gen");
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		String sajob = request.getParameter("sajob");
		int samgr = Integer.parseInt(request.getParameter("samgr"));
		int sapay = Integer.parseInt(request.getParameter("sapay"));
	
		SawonVO vo = new SawonVO();
		vo.setDeptno(deptno);
		vo.setSagen(gen);
		vo.setSajob(sajob);
		vo.setSamgr(samgr);
		vo.setSaname(name);
		vo.setSapay(sapay);
		
		int res = SawonDAO.getInstance().insertSawon(vo);

		response.sendRedirect("sawonlist.do");
	}

}
