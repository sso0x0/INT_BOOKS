package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/BoardWriteCon.do")
public class BoardWriteCon extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String bookTitle = request.getParameter("bookTitle");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginId");

		BoardDTO dto = new BoardDTO();
		dto.setBOARD_TITLE(boardTitle);
		dto.setBOOK_TITLE(bookTitle);
		dto.setBOARD_CONTENT(boardContent);
		dto.setMEMBER_ID(memberId);

		BoardDAO dao = new BoardDAO();
		dao.insertBoard(dto);

		response.sendRedirect(request.getContextPath() + "/BoardListControl.do");
	}
}