package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/list.do")
public class BoardListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("show");
		
		request.setAttribute("list",list);
		
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		
		disp.forward(request, response);
	}

}
