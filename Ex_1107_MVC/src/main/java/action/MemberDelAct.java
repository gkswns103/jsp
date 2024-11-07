package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/member_del.do")
public class MemberDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//회원 삭제 요청
		int res = MemberDAO.getInstance().delete(idx);
		
		String param = "no";
		
		if( res > 0) {
			param = "yes";
		}

		//삭제 결과를 json구조로 포장
		// {:} : 안정성이 좀 떨어짐
		// [{:}] : 안정적임
		String resultStr = String.format("[{'param':'%s'}]",param);
		
		//현재 서블릿이 작업을 마치고 약속된 콜백메서드로 돌아가야 한다.
		response.getWriter().println(resultStr);
		
	}

}
