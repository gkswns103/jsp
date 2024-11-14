package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;

@WebServlet("/photo_delete.do")
public class PhotoDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		String filename = PhotoDAO.getInstance().selectOne(idx).getFilename();
		
		String web_path = "/upload/";
		
		ServletContext app = request.getServletContext();
		
		String path = app.getRealPath(web_path);
		
		int res = PhotoDAO.getInstance().delete(idx);
		
		String param = "no";
		
		if(res > 0) {
			File f = new File(path,filename);
			if( f.exists() ) {
				f.delete(); // path경로의 파일을 삭제
			}
		}
		
		param = "yes";
		
		String resultStr = String.format("[{'param':'%s'}]",param);
		response.getWriter().println(resultStr);
	}

}
