package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ProductDAO;

@WebServlet("/productDel.do")
public class ProductDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String category = request.getParameter("category");
		
		// 위의 idx와 일치하는 장바구니의 모든 품목들을 먼저 삭제
		
		int cart_res = CartDAO.getInstance().cartdelete(idx);
		
		// 실제 삭제
		int pro_res = ProductDAO.getInstance().delete(idx);
		
		response.sendRedirect("list.do?category="+category);
	}

}
