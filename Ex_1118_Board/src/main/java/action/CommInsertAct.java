package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import vo.CommentVO;

@WebServlet("/comment_insert.do")
public class CommInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		CommentVO vo = new CommentVO();
		vo.setIdx(idx);
		vo.setContent(content);
		vo.setIp(ip);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res = CommentDAO.getInstance().insert(vo);
		String str = "no";
		
		if( res > 0 ) {
			str = "yes";
		}
		
		String resultStr = String.format("[{'result':'%s'}]",str);
		
		response.getWriter().println(resultStr);
	}

}
