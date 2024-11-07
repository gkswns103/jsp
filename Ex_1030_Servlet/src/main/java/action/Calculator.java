package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculator
 */
@WebServlet("/calc.do")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_num1 = request.getParameter("num1");
		String s_num2 = request.getParameter("num2");
		
		int num1 = Integer.parseInt(s_num1);
		int num2 = Integer.parseInt(s_num2);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("+ 결과 : " + (num1+num2) + "<br>");
		out.println("- 결과 : " + (num1-num2) + "<br>");
		out.println("* 결과 : " + (num1*num2) + "<br>");
		out.println("/ 결과 : " + (num1/num2) + "<br>");
		out.println("<a href='calculator.jsp'>다시하기</a>");
		out.println("</body>");
		out.println("</html>");
	}

}
