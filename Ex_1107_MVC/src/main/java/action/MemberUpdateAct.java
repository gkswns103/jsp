package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/member_update.do")
public class MemberUpdateAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path = "/upload/";
		
		ServletContext app = request.getServletContext();
		
		String path = app.getRealPath(web_path);
		
		MultipartRequest mr = new MultipartRequest(request, path,1024*1024*1000,"UTF-8",new DefaultFileRenamePolicy());
		
		int idx = Integer.parseInt(mr.getParameter("idx"));  
		String id = mr.getParameter("id");
		String pwd = mr.getParameter("pwd");
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String addr = mr.getParameter("addr");
		
		File f = mr.getFile("photo");
		
		String filename = "no";
		
		if( f != null) {
			filename = f.getName();
		}

		MemberVO vo = new MemberVO();
		vo.setIdx(idx);
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setAddr(addr);
		vo.setFilename(filename);
		
		int res = MemberDAO.getInstance().update(vo);
		
		String param = "no";
		
		if( res > 0) {
			param = "yes";
		}
		response.getWriter().println(param);
	}

}
