package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home/myhome")
public class MyHomeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 한글인코딩
		resp.setCharacterEncoding("utf-8");
		//응답 content type 설정(html페이지를 응답하겠다)
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>집에 가기 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>집이다~</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
