<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieTest1.jsp</title>
</head>
<body>
<%
// 쿠키(cookie 자바내장객체) : JSP내장객체 없음, 객체생성해서 사용
//						페이지, 서버, 사용자 컴퓨터 상관없이 값을 유지
// 						서버에서 값을 만들어서 사용자 컴퓨터 하드웨어에 저장

// 세션과 쿠키 공통점/차이점
// 세션 : 연결정보를 저장, 페이지 상관없이 값이 유지
//		서버에 저장, 보안이 필요한 값을 저장(로그인정보 등..)
// 쿠키 : 페이지, 서버, 사용자 컴퓨터 상관없이 값을 유지
// 		사용자 컴퓨터에 저장, 보안 상관없는 값을 저장, 서버에 부하없이 사용

// 쿠키 생성방법 1) HTTP헤더 이용, 2) cookie 자바내장객체(API) 이용
%>
<h1>jsp2/cookieTest1.jsp</h1>
<%
// 쿠키값 만들기
// cookie 객체생성 => 서버에 만들어짐
// Cookie cookie = new Cookie("이름", 값);
Cookie cookie = new Cookie("cname", "CookieValue");
// 쿠키 시간설정 유지시간설정(초)
cookie.setMaxAge(18000);
// 서버에 만들어진 쿠키값을 사용자 컴퓨터에 전달해서 저장
response.addCookie(cookie);
%>
쿠키주소		: <%=cookie %><br>
쿠키이름		: <%=cookie.getName() %><br>
쿠키값		: <%=cookie.getValue() %><br>
쿠키설정시간	: <%=cookie.getMaxAge() %>초<br> 
</body>
</html>