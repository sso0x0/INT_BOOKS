<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 어떤 요청이 왔는지 분석
    String cmd = request.getParameter("cmd");
    MemberDAO dao = new MemberDAO();

    // 로그인 처리 로직
    if ("login".equals(cmd)) {
        String memberId = request.getParameter("memberId");
        String memberPw = request.getParameter("memberPw");

        String memberName = dao.loginCheck(memberId, memberPw);

        if (memberName != null) {
            // 로그인 성공 시 세션 저장
            session.setAttribute("loginId", memberId);
            session.setAttribute("memberName", memberName);
%>
<script src="../assets/js/member.js"></script>
<script>onLoginSuccess("<%=memberName%>");</script>
<%
        } else {
            // 로그인 실패
%>
<script src="../assets/js/member.js"></script>
<script>onLoginFail();</script>
<%
        }
    }
    // 회원가입 (가입 성공 시 로그인 창으로 넘김)
    else if ("join".equals(cmd)) {
        MemberDTO member = new MemberDTO();
        member.setMEMBER_ID(request.getParameter("memberId"));
        member.setMEMBER_NAME(request.getParameter("memberName"));
        member.setMEMBER_PW(request.getParameter("memberPw"));
        member.setEMAIL(request.getParameter("email"));

        int result = dao.insertMember(member);

        if (result == 1) {
            // 회원가입 성공 시 로그인 창으로 이동
%>
<script src="../assets/js/member.js"></script>
<script>onJoinSuccess();</script>
<%
        } else {
            // 회원가입 실패
%>
<script src="../assets/js/member.js"></script>
<script>onJoinFail();</script>
<%
        }
    }

    // 로그아웃
    else if ("logout".equals(cmd)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
%>
