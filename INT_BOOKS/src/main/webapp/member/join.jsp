<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../assets/css/member.css">
<script src="../assets/js/member.js"></script>
<style>
body {
	min-height: 100vh;
	padding: 40px 0;
	box-sizing: border-box;
}

.input-group {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<div class="join-container">
		<h2>회원가입</h2>
		<form action="memberAction.jsp?cmd=join" method="post">
			<div class="input-group">
				<label class="input-label">아이디</label> <input type="text"
					name="memberId" required>
			</div>
			<div class="input-group">
				<label class="input-label">이름</label> <input type="text"
					name="memberName" required>
			</div>
			<div class="input-group">
				<label class="input-label">비밀번호</label> <input type="password"
					name="memberPw" required>
			</div>
			<div class="input-group">
				<label class="input-label">이메일</label> <input type="email"
					name="email" placeholder="example@domain.com" required>
			</div>
			<button type="submit" class="btn-submit">가입하기</button>
		</form>
		<div class="link-login">
			<a href="login.jsp">로그인</a>
		</div>
	</div>
</body>
</html>
