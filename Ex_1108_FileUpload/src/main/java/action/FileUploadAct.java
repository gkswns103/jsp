package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class FileUploadAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일을 저장할 절대 경로
		String web_path = "/img/";
		
		// 현재 프로젝트를 관리하는 객체
		ServletContext application = request.getServletContext();
		
		// 상대경로 -> 절대경로
		String path = application.getRealPath(web_path);
		
		// 최대 업로드 용량 : 100MB
		int max_size = 1024 * 1024 * 1000;
		
		// 파일을 포함하고 있는 파라미터 수신을 위한 객체
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "UTF-8", new DefaultFileRenamePolicy());
		
		//업로드 된 파일 정보 얻어오기
		String filename = "no_file";
		
		File f = mr.getFile("photo");
		
		if( f != null ) {
			// 파일 업로드에 성공했다면
			filename = f.getName(); // 실제 파일명
		}
		
		// 파일 이외의 파라미터 수신
		String title = mr.getParameter("title");
		
		request.setAttribute("title",title);
		request.setAttribute("filename",filename);
		
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}

}
