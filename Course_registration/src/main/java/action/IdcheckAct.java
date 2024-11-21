package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import dto.StudentDTO;

@WebServlet("/id_check.do")
public class IdcheckAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String stuid = request.getParameter("stuid");
		
		StudentDTO dto = StudentDAO.getInstance().selectId(stuid);
		
		String msg = "no";
		if(dto == null) {
			// 회원이없는경우
			response.getWriter().println(msg);
		}
		else {
			// 회원이 있는경우
			msg = "yes";
			response.getWriter().println(msg);
		}
	}

}
