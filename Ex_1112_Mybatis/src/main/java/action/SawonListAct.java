package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawonlist.do")
public class SawonListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// sawonlist.do? <---- null
		// sawonlist.do?deptno= <--- empty
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		
		// 파라미터의 null체크
		// isEmpty() 보다 null체크를 먼저해야함!
		if( str_deptno != null  && !str_deptno.isEmpty()) {
			deptno = Integer.parseInt(str_deptno);
		}
		
		List<SawonVO> list = null;
		
		if( deptno == 0 ) {
			list = SawonDAO.getInstance().select();
		}
		else {
			list = SawonDAO.getInstance().select(deptno);
		}
		
		request.setAttribute("list",list);
		
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		
		disp.forward(request, response);
		
	}

}