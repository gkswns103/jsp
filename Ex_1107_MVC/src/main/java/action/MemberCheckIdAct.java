package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/check_id.do")
public class MemberCheckIdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String result;
		int res;
		if( vo == null ) {
			// 회원 없는 경우
			res = 1;
			result = String.format("[{'r':'%d'},{'res':'은 가입 가능합니다'},{'id':'%s'}]",res, id);
		}
		else {
			// 회원 있는 경우
			res = 0;
			result = String.format("[{'r':'%d'},{'res':'은 가입 불가'},{'id':'%s'}]",res, id);
		}
		//json 구조에 한글이 포함되어있으면 콜백을 전달될때 데이터가 꺠짐 이를 방지하기 위해 UTF-8 세팅이 필요함
		
		response.setContentType("text/plain;charset=UTF-8");
		
		response.getWriter().println(result);
	}

}
