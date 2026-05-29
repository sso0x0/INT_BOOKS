package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

@WebServlet("/BoardDeleteCon.do")
public class BoardDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 게시글 번호 받기
		int boardNum = Integer.parseInt(request.getParameter("board_num"));

		// DAO
		BoardDAO dao = new BoardDAO();

		// DB 삭제
		dao.deleteBoard(boardNum);

		// 목록 이동
		response.sendRedirect(request.getContextPath() + "/BoardListControl.do");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}