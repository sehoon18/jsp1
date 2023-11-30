<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/response.jsp</title>
</head>
<body>
<!-- 2) response JSP내장객체 => HttpServletResponse 자바 내장객체
		=> 기억장소 할당(객체 생성)
		=> HTTP 요청에 대한 응답 정보를 저장하는 객체
		=> 응답정보를 저장하면 웹서버 전달 => HTTP에 전달 => 사용자 전달
		=> response.setHeader("헤더이름", 헤더값) 사용자의 헤더값 변경
			response.addCookie(쿠키값) 쿠키값을 사용자 컴퓨터에 파일로 저장
			response.setContentType("text/html; charset=UTF-8") 사용자 보는 페이지 내용 타입 변경
			response.sendRedirect("주소") 사용자페이지를 다른곳으로 이동 설정(주소변경 => 하이퍼링크)
			 -->
		<% 
		response.sendRedirect("request.jsp");
		%>	 
</body>
</html>