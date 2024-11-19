package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

@WebServlet("/del.do")
public class BoardDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = BoardDAO.getInstance().del_update(idx);
		
		String result = "fail";
		
		if(res == 1) {
			result = "succ";
		}
		String resStr = String.format("[{'result':'%s'}]",result);
		
		response.getWriter().println(resStr);
	}

}
