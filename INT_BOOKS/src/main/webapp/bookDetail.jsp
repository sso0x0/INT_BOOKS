<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>책 상세보기 - INT_BOOKS</title>
<link rel="stylesheet" href="assets/css/bookDetail.css">
</head>
<body>
	<header>
		<div class="container">
			<h1>INT_BOOKS</h1>
			<button type="button" onclick="history.back()">뒤로가기</button>
		</div>
	</header>
	<main class="container">
		<section class="row">
			<div>
				<img id="bookImage" src="" alt="책 표지">
			</div>
			<div class="info-row">
				<span class="info-label"><strong>출판일</strong></span> <span
					id="bookPubdate" class="info-value">-</span>
			</div>
			<div>
				<h2 id="bookTitle">책 제목</h2>
				<p>
					<strong>저자</strong> <span id="bookAuthor"></span>
				</p>
				<p>
					<strong>출판사</strong> <span id="bookPublisher"></span>
				</p>
				<p>
					<strong>ISBN</strong> <span id="bookIsbn"></span>
				</p>
				<p>
					<strong>가격</strong> <span id="bookPrice"></span>
				</p>
				<hr>
				<p id="bookDescription"></p>
			</div>
		</section>
	</main>

	<script>
        let params = new URLSearchParams(location.search);
        let isbn = params.get("isbn");

        if (isbn == null || isbn.trim() == "") {
            document.getElementById("bookTitle").innerHTML = "책 정보를 찾을 수 없습니다.";
        } else {
            fetch("bookSearch.jsp?query=" + encodeURIComponent(isbn) + "&display=1&start=1")
                .then(function(response) {
                    return response.json();
                })
                .then(function(data) {
                    if (data.items.length == 0) {
                        document.getElementById("bookTitle").innerHTML = "책 정보를 찾을 수 없습니다.";
                        return;
                    }

                    let book = data.items[0];

                    document.getElementById("bookImage").src = book.image;
                    document.getElementById("bookPubdate").innerHTML = book.pubdate;
                    document.getElementById("bookImage").alt = book.title;
                    document.getElementById("bookTitle").innerHTML = book.title;
                    document.getElementById("bookAuthor").innerHTML = book.author;
                    document.getElementById("bookPublisher").innerHTML = book.publisher;
                    document.getElementById("bookDescription").innerHTML = book.description;
                    document.getElementById("bookIsbn").innerHTML = book.isbn; 
					
                    if(book.discount == ""||book.discount==0){
                    	document.getElementById("bookPrice").innerHTML = "가격정보가 없습니다.";
                    } else {
                    	document.getElementById("bookPrice").innerHTML = Number(book.discount).toLocaleString()+"원";
                    }
                })
                .catch(function() {
                    document.getElementById("bookTitle").innerHTML = "Book API error";
                });
        }
    </script>
</body>
</html>
