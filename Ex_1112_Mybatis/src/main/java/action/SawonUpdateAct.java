package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawon_update.do")
public class SawonUpdateAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int sabun = Integer.parseInt(request.getParameter("sabun"));
		String saname = request.getParameter("saname");
		String sagen = request.getParameter("sagen");
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		String sajob = request.getParameter("sajob");
		String sahire = request.getParameter("sahire");
		int samgr = Integer.parseInt(request.getParameter("samgr"));
		int sapay = Integer.parseInt(request.getParameter("sapay"));
		
		SawonVO vo = new SawonVO();
		vo.setDeptno(deptno);
		vo.setSabun(sabun);
		vo.setSagen(sagen);
		vo.setSahire(sahire);
		vo.setSajob(sajob);
		vo.setSamgr(samgr);
		vo.setSaname(saname);
		vo.setSapay(sapay);
		
		int res = SawonDAO.getInstance().updateSawon(vo);
		response.sendRedirect("sawonlist.do");
	}

}
