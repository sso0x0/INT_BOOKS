<%@ page contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// Naver API 인증키
	String clientId = "qO1xsBbU9nR3hx2hYEtV";
	String clientSecret = "xz1_qysVmU";
	
	// main.js에서 보낸 검색어와 출력 개수
	String query = request.getParameter("query");
	String display = request.getParameter("display");
	
	// Naver 도서 검색 API 주소
	String apiUrl = "https://openapi.naver.com/v1/search/book.json?query=" + URLEncoder.encode(query, "UTF-8") + "&display="
			+ display;
	
	URL url = new URL(apiUrl);
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	
	conn.setRequestMethod("GET");
	// Naver 검색 API는 인증키를 header에 담아서 보냄
	conn.setRequestProperty("X-Naver-Client-Id", clientId);
	conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	
	int responseCode = conn.getResponseCode();
	BufferedReader br = null;
	
	if (responseCode == 200) {
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	} else {
		response.setStatus(responseCode);
		br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	}
	
	String line;
	StringBuffer result = new StringBuffer();
	
	while ((line = br.readLine()) != null) {
		result.append(line);
	}
	
	br.close();
	conn.disconnect();
	
	out.print(result.toString());
%>