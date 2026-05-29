<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../assets/css/member.css">
<script src="../assets/js/member.js"></script>
<style>
body {
	height: 100vh;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>INT BOOKS</h2>
		<form action="memberAction.jsp?cmd=login" method="post">
			<div class="input-group">
				<input type="text" name="memberId" placeholder="아이디" required>
			</div>
			<div class="input-group">
				<input type="password" name="memberPw" placeholder="비밀번호" required>
			</div>
			<button type="submit" class="btn-submit">로그인</button>
		</form>
		<div class="link-join">
			<a href="join.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>
