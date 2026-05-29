<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>INT BOOKS</title>
<link rel="stylesheet" href="assets/css/home.css">
</head>
<body>
	<header class="top-bar">
		<h1>INT_BOOKS</h1>
	</header>
	<main class="page">
		<section class="section-head">
			<h2>오늘의 도서</h2>
		</section>
		<div id="searchLine">
			<input type="text" id="search" placeholder="검색어를 입력하세요">
			<button id="searchBtn">검색</button>
			<button id="reset">초기화</button>
			<button id="bbs">게시판</button>
			<button id="mypage">마이페이지</button>
		</div>
		<div id="pages"></div>
		<section id="bookGrid" class="book-grid" aria-live="polite"></section>
	</main>
	<footer> </footer>
	<script src="assets/js/home.js"></script>
</body>
</html>