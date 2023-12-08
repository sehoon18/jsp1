<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieExample1.jsp</title>
</head>
<body>
<%
// 쿠키값 가져오기
// 사용자 컴퓨터에서 가져온 요청정보(쿠키)를 서버에 전달 => requset에 저장
// 1) request에서 쿠키값 가져오기 => 변수에 저장
Cookie cookies[] = request.getCookies();
String clanguageValue = "korea";

// 2) request에 쿠키값이 있으면 => if
if (cookies != null){
// 3) for 접근
	for(int i = 0; i < cookies.length; i++){
// 4) if 접근해서 찾은 쿠키값이름 "clanguage" 찾기
		if (cookies[i].getName().equals("clanguage")){
// 5) 화면에 출력 (쿠키이름, 쿠키값 출력)
			out.println("쿠키이름 : " + cookies[i].getName());			
			out.println("쿠키값 : " + cookies[i].getValue());
			clanguageValue = cookies[i].getValue();
		}
		
	}
	
}

// 쿠키값을 비교해서 "korea"이면 "안녕하세요", "english"이면 "Hello" 출력
if (clanguageValue.equals("korea")){
	out.println("<h1>안녕하세요</h1>");
} else if (clanguageValue.equals("english")){
	out.println("<h1>Hello</h1>");
}

%>
<h1>jsp2/cookieExample1.jsp</h1>
<form action="cookieExample2.jsp" method="get">
<input type="radio" name="language" value="korea">한국어 페이지 보기
<input type="radio" name="language" value="english">영어 페이지 보기
<input type="submit" value="확인">
</form>




</body>
</html>