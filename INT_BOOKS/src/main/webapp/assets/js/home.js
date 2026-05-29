const bookGrid = document.getElementById("bookGrid");
let query = "베스트셀러"; // url상에 사용자가 검색한 검색어
let page = 1; // 페이지 설정
const displayNum = 30; // 화면에 출력할 도서 권수

function loadBooks(query) {

    let start = (page - 1) * displayNum + 1;

    let url = "bookSearch.jsp?query=" + encodeURIComponent(query)
        + "&display=" + displayNum
        + "&start=" + start;

    bookGrid.innerHTML = "<p>Loading books...</p>";

    //API에 url 요청
    fetch(url)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            bookGrid.innerHTML = "";

            // 검색결과 없을 시, 메세지 출력
            if (data.items.length == 0) {
                bookGrid.innerHTML = "검색결과가 없습니다"
                return;
            }

            for (var i = 0;i < data.items.length;i++) {
                let book = data.items[i];

                // 화면에 뿌려줄 정보 담을 태그 생성
                let box = document.createElement("div");
                let image = document.createElement("img");
                let title = document.createElement("p");
                let author = document.createElement("p");
                let link = document.createElement("a");

                link.href = "bookDetail.jsp?isbn=" + encodeURIComponent(book.isbn);

                image.src = book.image;
                image.alt = book.title;
                image.width = 120;

                title.innerHTML = book.title;
                author.innerHTML = book.author;

                link.appendChild(image);
                box.appendChild(link);
                box.appendChild(title);
                box.appendChild(author);

                bookGrid.appendChild(box);

            }
            makePageButtons(data.total);
        })
        .catch(function() {
            bookGrid.innerHTML = "<p>Book API error</p>";
        });
};

function makePageButtons(total) {
    let pageArea = document.getElementById("pages");
    pageArea.innerHTML = "";

    let totalPage = Math.ceil(total / displayNum);
    let maxPage = Math.ceil(1000 / displayNum);

    if (totalPage > maxPage) {
        totalPage = maxPage;
    }

    for (let i = 1;i <= totalPage;i++) {
        let pageBtn = document.createElement("button");
        pageBtn.innerHTML = i;

        pageBtn.addEventListener("click", function() {
            page = i;
            loadBooks(query);
        });

        pageArea.appendChild(pageBtn);
    }
}

// 화면 실행 시, Default값으로 보여줄 책 목록
loadBooks("베스트셀러");

// 검색기능 구현
document.getElementById("searchBtn").addEventListener("click", function() {
    query = document.getElementById("search").value;
    if (query.trim() == "") {
        alert("검색어를 입력하세요");
        return;
    } else {
        loadBooks(query);
    }
});

// 초기화 기능 구현
document.getElementById("reset").addEventListener("click", function() {
    query = document.getElementById("search").value;
    loadBooks("베스트셀러");
});

// 게시판 이동
document.getElementById("bbs").addEventListener("click", function() {
    location.href = "/INT_BOOKS/BoardListControl.do";
});

// 마이페이지 이동
document.getElementById("mypage").addEventListener("click", function() {
    location.href = "/INT_BOOKS/mypage/mypage.jsp";
});