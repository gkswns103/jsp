package action;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import dto.StudentDTO;

@WebServlet("/register.do")
public class RegisterAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String grade = request.getParameter("grade");
		int proidx;
		Random r = new Random();
		if(major.equals("정보통신학부")) {
			proidx = r.nextInt(7) + 1;
		}else {
			proidx= r.nextInt(2) + 7;
		}
		
		StudentDTO dto = new StudentDTO();
		dto.setStunumber(id);
		dto.setStupwd(pwd);
		dto.setStuname(name);
		dto.setMajor(major);
		dto.setGrade(grade);
		dto.setProidx(proidx);
		
		int res = StudentDAO.getInstance().insert_student(dto);
		
		if(res > 0) {
			//회원가입 성공
			response.getWriter().println("yes");
		}
		else {
			response.getWriter().println("no");
		}
	}

}
