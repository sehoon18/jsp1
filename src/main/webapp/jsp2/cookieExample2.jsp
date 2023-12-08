<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieExample2.jsp</title>
</head>
<body>
<h1>jsp2/cookieExample2.jsp</h1>
사용자가 선택한 값 : <%=request.getParameter("language") %><br>

<%
// 쿠키객체생성 '이름', 값 => ('clanguage', 사용자가 선택한 값)
Cookie cookie = new Cookie("clanguage", request.getParameter("language"));
cookie.setMaxAge(3600); // 쿠키 시간설정 3600초
response.addCookie(cookie); // 쿠키를 response에 저장 => 사용자 컴퓨터에 저장
%>

쿠키주소		: <%=cookie %><br>
쿠키이름		: <%=cookie.getName() %><br>
쿠키값 		: <%=cookie.getValue() %><br>
쿠키설정시간	: <%=cookie.getMaxAge() %><br>
<a href="cookieExample1.jsp">쿠키값 가져오기 (설정된 언어 페이지 보기)</a> 
</body>
</html>