package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawon_update_form.do")
public class SawonUpdateFormAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sabun = Integer.parseInt(request.getParameter("sabun"));
		
		SawonVO vo = SawonDAO.getInstance().selectSawon(sabun);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("sawon_update_form.jsp");
		
		disp.forward(request, response);
	}

}
