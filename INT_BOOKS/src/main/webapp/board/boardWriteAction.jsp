<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String bookTitle = request.getParameter("bookTitle");
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String isAnon = request.getParameter("isAnon");
	
	// 세션에서 로그인한 아이디 가져오기
	String memberId = (String) session.getAttribute("loginId");
	
	BoardDTO dto = new BoardDTO();
	dto.setBOARD_TITLE(boardTitle);
	dto.setBOOK_TITLE(bookTitle);
	dto.setBOARD_CONTENT(boardContent);
	dto.setMEMBER_ID(memberId);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(dto);
%>
<script>
	alert("리뷰가 성공적으로 등록되었습니다!");
	location.href = "boardList.jsp";
</script>