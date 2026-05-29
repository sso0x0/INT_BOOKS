<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("/INT_BOOKS/member/login.jsp");
		return;
	}
	
	String newPw = request.getParameter("newPw");
	String newEmail = request.getParameter("newEmail");
	
	MemberDAO dao = new MemberDAO();
	
	MemberDTO bean = dao.oneSelectMember(loginId);
	
	if (newPw != null && !newPw.trim().isEmpty()) {
		bean.setMEMBER_PW(newPw.trim());
	}
	if (newEmail != null && !newEmail.trim().isEmpty()) {
		bean.setEMAIL(newEmail.trim());
	}
	
	int result = dao.updateMember(bean);
	
	if (result > 0) {
		session.setAttribute("msg", "수정이 완료되었습니다!");
	} else {
		session.setAttribute("msg", "수정에 실패했습니다.");
	}
	
	response.sendRedirect("/INT_BOOKS/mypage/mypage.jsp");
%>