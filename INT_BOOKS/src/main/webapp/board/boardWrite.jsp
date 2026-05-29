<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = (String) session.getAttribute("loginId");
	String memberName = (String) session.getAttribute("memberName");
	
	if (memberId == null) {
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location.href = "../login.jsp";
</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 게시판 글쓰기</title>
<link href="../assets/css/boardWrite.css" rel="stylesheet">
</head>
<body>
	<div class="write-container">
		<div class="write-header">
			<h2>책 리뷰 쓰기</h2>
		</div>
		<div class="write-body">
			<form action="${pageContext.request.contextPath}/BoardWriteCon.do" method="post">
				<div class="author-row">
					<span class="author-label">작성자</span> <span class="author-value"><%=memberName%></span>
				</div>
				<div class="input-group">
					<label class="input-label">책 제목</label> <input type="text"
						name="bookTitle" placeholder="리뷰할 책의 제목을 입력하세요" required>
				</div>
				<div class="input-group">
					<label class="input-label">글 제목</label> <input type="text"
						name="boardTitle" placeholder="게시글 제목을 입력하세요" required>
				</div>
				<div class="input-group">
					<label class="input-label">리뷰 내용</label>
					<textarea name="boardContent" rows="10"
						placeholder="자유롭게 책에 대한 리뷰를 남겨주세요!" required></textarea>
				</div>
				<div class="btn-row">
					<button type="button" class="btn-back" onclick="history.back()">뒤로가기</button>
					<button type="submit" class="btn-submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
