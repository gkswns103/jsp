package action;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/insert.do")
public class PhotoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ip = request.getRemoteAddr();
		
		LocalDateTime currentDateTime = LocalDateTime.now();

	        // 날짜와 시간 포맷 지정
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // 포맷을 적용하여 문자열로 변환
	    String date = currentDateTime.format(formatter);
		
		String web_path = "/upload/";
		
		ServletContext app = request.getServletContext();
		
		String path = app.getRealPath(web_path);
		
		MultipartRequest mr = new MultipartRequest(request,path,1024*1024*1000,"UTF-8" ,new DefaultFileRenamePolicy());
		
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		File photo = mr.getFile("photo");
		PhotoVO vo = new PhotoVO();
		
		vo.setFilename(photo.getName());
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setIp(ip);
		vo.setRegdate(date);
		
		int res = PhotoDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do");
	}

}
