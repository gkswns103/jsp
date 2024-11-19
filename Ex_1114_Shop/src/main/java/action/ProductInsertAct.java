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

import dao.ProductDAO;
import vo.ProductVO;


@WebServlet("/insert.do")
public class ProductInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path="/images/";
		
		ServletContext app=request.getServletContext();
		
		String path=app.getRealPath(web_path);
		
		int max_size=1024*1024*1000;
		
		
		MultipartRequest mr=new MultipartRequest(request,path,max_size, "utf-8");
		
		
		String category= mr.getParameter("category");
		String p_num=mr.getParameter("p_num");
		String p_name=mr.getParameter("p_name");
		String p_company=mr.getParameter("p_company");
		String p_content=mr.getParameter("p_content");		
		
		int p_price=Integer.parseInt(mr.getParameter("p_price"));
		int p_saleprice=Integer.parseInt(mr.getParameter("p_saleprice"));
		
		String p_image_s="";
		String p_image_l="";
		
		File f=mr.getFile("p_image_s");
		if(f !=null ) {
			p_image_s=f.getName();
		}
		
		f=mr.getFile("p_image_l");
		
		if(f!=null) {
			p_image_l=f.getName();
		}
		
		ProductVO vo=new ProductVO();
		vo.setCategory(category);
		vo.setP_num(p_num);
		vo.setP_name(p_name);
		vo.setP_company(p_company);
		vo.setP_content(p_content);
		vo.setP_price(p_price);
		vo.setP_saleprice(p_saleprice);
		
		vo.setP_image_s(p_image_s);
		vo.setP_image_l(p_image_l);
	
		int res=ProductDAO.getInstance().insert_prod(vo);
		System.out.println("insert 결과 : " +res);
		response.sendRedirect("list.do?category="+category);
		
	}

}
