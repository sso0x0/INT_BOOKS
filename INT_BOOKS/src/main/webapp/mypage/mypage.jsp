<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("/INT_BOOKS/member/login.jsp");
		return;
	}
	MemberDAO dao = new MemberDAO();
	Map<String, String> member = dao.getMemberMap(loginId);
	
	String msg = (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="../assets/css/mypage.css" rel="stylesheet">
<%
	if (msg != null) {
%>
<script type="text/javascript">
    window.onload = function() {
        alert("<%=msg%>");
	};
</script>
<%
	}
%>
</head>
<body>
	<div class="mypage-container">
		<div class="profile-header">
			<div class="profile-name"><%=member.get("memberName")%>님, 환영합니다 :)</div>
		</div>
		<div class="section">
			<div class="section-title">내 정보</div>
			<div class="info-item">
				<div class="info-label">아이디</div>
				<div class="info-value"><%=member.get("memberId")%></div>
			</div>
			<div class="info-item">
				<div class="info-label">이름</div>
				<div class="info-value"><%=member.get("memberName")%></div>
			</div>
			<div class="info-item">
				<div class="info-label">이메일</div>
				<div class="info-value"><%=member.get("email")%></div>
			</div>
		</div>
		<div class="section">
			<div class="section-title">정보 수정</div>
			<form action="/INT_BOOKS/mypage/mypageUpdate.jsp" method="post">
				<div class="input-group">
					<label class="input-label">새 비밀번호</label> <input type="password"
						name="newPw" placeholder="변경할 비밀번호 입력">
				</div>
				<div class="input-group">
					<label class="input-label">새 이메일</label> <input type="email"
						name="newEmail" value="<%=member.get("email")%>"
						placeholder="변경할 이메일 입력">
				</div>
				<button type="submit" class="btn-submit">수정하기</button>
			</form>
			<form action="/INT_BOOKS/member/memberAction.jsp" method="post"
				style="margin-top: 10px;">
				<input type="hidden" name="cmd" value="logout">
				<button type="submit" class="btn-logout">로그아웃</button>
			</form>
		</div>
	</div>
	<div class="link-login">
		<a href="/INT_BOOKS/home.jsp">홈으로 돌아가기</a>
	</div>
</body>
</html>