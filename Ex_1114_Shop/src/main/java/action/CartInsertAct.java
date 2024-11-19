package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;


@WebServlet("/cart_insert.do")
public class CartInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//상품번호
		int idx=Integer.parseInt(request.getParameter("idx"));
			
		//로그인 되있는 현재 회원 번호
		int m_idx=Integer.parseInt(request.getParameter("m_idx"));
		
		CartVO vo=new CartVO();
		vo.setIdx(idx);
		vo.setM_idx(m_idx);
		
		//이미 장바구니에 있는 상품인지 조회
		CartVO res_vo=CartDAO.getInstance().selectOne(vo);
		
		String result="no";
		
		if(res_vo ==null) {
			//장바구니에 상품 추가
			int res=CartDAO.getInstance().insert(vo);
			
			System.out.println("장바구니 insert 결과 : "+ res );
		    if(res==1) {//추가 성공
		    	result="yes";
		    	
		    }else {//추가 실패
		    	result="fail";
		    	
		    }
			
		}//if
		
		String resultStr=String.format("[{'result':'%s'}]", result);
		response.getWriter().println(resultStr);
		
		
		
	}

}
