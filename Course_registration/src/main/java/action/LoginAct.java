package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDAO;
import dto.StudentDTO;

@WebServlet("/login.do")
public class LoginAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		StudentDTO student = StudentDAO.getInstance().selectId(id);
		
		if(student == null) {
			// 아이디가 없는경우
			request.setAttribute("errorMsg","없는아이디입니다.");
			RequestDispatcher dis = request.getRequestDispatcher("login_register.jsp");
			dis.forward(request, response);
		}
		else if(student != null){
			if( !student.getStupwd().equals(pwd) ) {
				//비밀번호 틀린경우
				request.setAttribute("errorMsg","잘못된 비밀번호입니다.");
				RequestDispatcher dis = request.getRequestDispatcher("login_register.jsp");
				dis.forward(request, response);
			}
			else {
				//로그인성공
				session.setAttribute("student",student);
				response.sendRedirect("classlist.do");
			}
		}
	}

}
