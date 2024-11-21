package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDAO;
import dto.ClassDTO;

@WebServlet("/classlist.do")
public class ClassListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search_class = request.getParameter("search_class");
		
		List<ClassDTO> list;
		
		if( search_class != null && !search_class.isEmpty()) {
			list = ClassDAO.getInstance().select_search_list(search_class);
		}
		else {
			list = ClassDAO.getInstance().select_list();
		}
		
		request.setAttribute("classlist",list);
		
		RequestDispatcher disp = request.getRequestDispatcher("home.jsp");
		
		disp.forward(request, response);
		
	}

}
