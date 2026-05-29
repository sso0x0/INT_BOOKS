<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memberId" value="${sessionScope.loginId}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>도서 리뷰 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/boardInfo.css">
</head>

<body>
	<div class="info-container">
		<div class="info-header">
			<div class="info-title">${bean.BOARD_TITLE}</div>
		</div>
		<div class="info-body">
			<div class="info-row info-row-inline">
				<span class="info-label">작성자</span> <span
					class="info-content info-content-plain">${bean.MEMBER_NAME}</span>
			</div>
			<div class="info-row">
				<div class="info-label">조회수</div>
				<div class="info-content">${bean.READ_COUNT}</div>
			</div>
			<div class="info-row">
				<div class="info-label">작성일자</div>
				<div class="info-content">${bean.CREATED_AT}</div>
			</div>
			<div class="info-row">
				<div class="info-label">책 제목</div>
				<div class="info-content">${bean.BOOK_TITLE}</div>
			</div>
			<div class="info-row">
				<div class="info-label">작성내용</div>
				<div class="info-content">${bean.BOARD_CONTENT}</div>
			</div>
			<div class="btn-row">
				<div class="btn-left">
					<button class="btn btn-back"
						onclick="location.href='${pageContext.request.contextPath}/BoardListControl.do'">목록보기</button>
				</div>
				<div class="btn-right">
					<button id="deleteBtn" class="btn btn-delete"
						onclick="deleteBoard()" style="display: none;">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
			var loginId = "${memberId}";
			var writerId = "${bean.MEMBER_ID}";

			console.log("로그인ID:", loginId, "작성자ID:", writerId);

			// 두 ID가 일치할 때만 삭제 버튼을 노출
			if (loginId && writerId && loginId === writerId) {
				document.getElementById("deleteBtn").style.display = "inline-block";
			}
		};

		// 삭제 버튼 클릭 시 실행
		function deleteBoard() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = '${pageContext.request.contextPath}/BoardDeleteCon.do?board_num=${bean.BOARD_NUM}';
			}
		}
	</script>
</body>
</html>