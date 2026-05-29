# 📚 INT_BOOKS

네이버 도서 API를 활용한 도서 검색 및 리뷰 게시판 웹 애플리케이션입니다.

---

## 주요 기능

- **도서 검색**: 네이버 도서 API를 통해 키워드로 책 검색 및 상세 정보 조회
- **회원 관리**: 회원가입, 로그인, 마이페이지(정보 수정)
- **게시판**: 게시글 작성, 목록 조회, 상세 조회, 삭제 (조회수 자동 증가)

---

## 기술 스택

- **Language**: Java
- **Frontend**: JSP, HTML/CSS, JavaScript
- **Backend**: Java Servlet (MVC 패턴)
- **Database**: Oracle DB (JDBC, JNDI 커넥션 풀)
- **Library**: JSTL 1.2, Lombok, ojdbc8
- **Server**: Apache Tomcat
- **External API**: 네이버 도서 검색 API

---

## 프로젝트 구조

```
INT_BOOKS/
├── src/main/
│   ├── java/
│   │   ├── controller/         # Servlet 컨트롤러
│   │   │   ├── BoardListControl.java
│   │   │   ├── BoardInfoControl.java
│   │   │   ├── BoardWriteCon.java
│   │   │   └── BoardDeleteCon.java
│   │   └── model/              # DAO / DTO
│   │       ├── BoardDAO.java
│   │       ├── BoardDTO.java
│   │       ├── MemberDAO.java
│   │       ├── MemberDTO.java
│   │       └── DBUtil.java
│   ├── webapp/
│   │   ├── board/              # 게시판 JSP
│   │   ├── member/             # 회원 JSP (로그인, 회원가입)
│   │   ├── mypage/             # 마이페이지 JSP
│   │   ├── assets/             # CSS, JS
│   │   ├── home.jsp            # 메인(도서 검색) 페이지
│   │   ├── bookSearch.jsp      # 네이버 API 호출
│   │   └── bookDetail.jsp      # 도서 상세 페이지
│   └── INT_BOOKS.sql           # DB 초기화 스크립트
```

---

## DB 설정

Oracle DB를 사용하며, `INT_BOOKS.sql`로 초기화합니다.

```sql
-- 사용자 생성
CREATE USER INT_BOOKS IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO INT_BOOKS;

-- 주요 테이블: MEMBER, BOARD
-- 시퀀스: BOARD_SEQ (게시글 번호 자동 증가)
```

Tomcat의 `context.xml`에 JNDI DataSource를 `jdbc/xe`로 등록해야 합니다.

---

## 실행 방법

1. Oracle DB 실행 후 `INT_BOOKS.sql` 스크립트 실행
2. /INT_BOOKS/src/main/webapp/member/login.jsp 실행
