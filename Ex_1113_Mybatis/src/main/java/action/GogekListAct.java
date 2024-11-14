package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

@WebServlet("/gogeklist.do")
public class GogekListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addr = request.getParameter("addr");
		
		List<GogekVO> list = null;
		
		if( addr != null && !addr.isEmpty()) {
			list = GogekDAO.getInstance().select_list(addr);
		}
		else {
			list = GogekDAO.getInstance().select_list();
		}
		
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		
		disp.forward(request, response);
	}

}
