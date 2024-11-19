package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/upd.do")
public class BoardUpdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		String ip = request.getRemoteAddr();
		
		BoardVO vo = new BoardVO();
		vo.setContent(content);
		vo.setIdx(idx);
		vo.setIp(ip);
		vo.setName(name);
		vo.setSubject(subject);
		
		int res = BoardDAO.getInstance().update(vo);
		System.out.println(res);
		response.sendRedirect("list.do");
		
	}

}
