package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/BoardInfoControl.do")
public class BoardInfoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 파라미터에서 board_num 추출
		String boardNumStr = request.getParameter("board_num");

		// 유효성 검사
		if (boardNumStr == null || boardNumStr.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/boardList.jsp");
			return;
		}

		int boardNum;
		try {
			boardNum = Integer.parseInt(boardNumStr.trim());
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/boardList.jsp");
			return;
		}

		// DAO를 통해 글 상세 조회 (조회수 자동 증가)
		BoardDAO dao = new BoardDAO();
		BoardDTO bean = dao.getOneBoard(boardNum);

		// 게시글이 없는 경우 목록으로 리다이렉트
		if (bean == null) {
			response.sendRedirect(request.getContextPath() + "/boardList.jsp");
			return;
		}

		// JSP로 데이터 전달 후 포워딩
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("/board/boardInfo.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}