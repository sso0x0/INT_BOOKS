<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/boardList.css">
</head>
<body>
	<div class="list-container">

		<!-- 헤더 -->
		<div class="list-header">
			<button type="button" class="btn-home"
				onclick="location.href='${pageContext.request.contextPath}/home.jsp'">홈</button>
			<h2>게시판</h2>
			<button type="button" class="btn-write"
				onclick="location.href='${pageContext.request.contextPath}/board/boardWrite.jsp'">글쓰기</button>
		</div>

		<!-- 테이블 -->
		<table class="board-table">
			<thead>
				<tr>
					<th class="col-title">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boardList}">
					<tr class="empty-row">
						<td colspan="4">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty boardList}">
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td class="col-title"><a
								href="${pageContext.request.contextPath}/BoardInfoControl.do?board_num=${board.BOARD_NUM}">
									<c:out value="${board.BOARD_TITLE}" />
							</a></td>
							<td><c:out value="${board.MEMBER_NAME}" /></td>
							<td><c:out value="${board.CREATED_AT}" /></td>
							<td><c:out value="${board.READ_COUNT}" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>
