<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<!-- http가 들고온 요청정보 : 파라미터값(태그이름 = 값), 서버정보, 사용자정보, 쿠키정보(세션정보), http헤더(http에서 저장된 정보)
	=> 서버에 전달 => 서버 request에 요청정보 저장	-->
서버이름(서버 도메인) : <%=request.getServerName() %><br>
서버포트번호 : <%=request.getServerPort() %><br>
요청한 주소 (URL) : <%=request.getRequestURL() %><br>
주소에서 서버 뺀 주소 (URI) : <%=request.getRequestURI() %><br>
클라이언트(유저) IP주소 : <%=request.getRemoteAddr() %><br>
프로토콜 : <%=request.getProtocol() %><br>
요청방식 : <%=request.getMethod() %><br>
컨텍스트(프로젝트) 경로 ㅣ <%=request.getContextPath() %><br>
물리적인 경로 : <%=request.getRealPath("/") %>)<br>

http 헤더정보(언어) : <%=request.getHeader("accept-language") %><br>
http 헤더정보(브라우저) : <%=request.getHeader("user-agent") %><br>
</body>
</html>