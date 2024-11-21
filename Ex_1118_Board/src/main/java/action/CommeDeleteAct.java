package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;

@WebServlet("/comment_del.do")
public class CommeDeleteAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		int res = CommentDAO.getInstance().delete(c_idx);
		
		String str = "no";
		
		if( res == 1 ) {
			str = "yes";
		}
		
		String resultStr = String.format("[{'result':'%s'}]",str);
		
		response.getWriter().println(resultStr);
		
	}

}
