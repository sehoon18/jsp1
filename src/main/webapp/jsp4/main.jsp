<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/main.jsp</title>
</head>
<body>
<%=session.getAttribute("id") %>님이 로그인하셨습니다.<br>
<a href="info.jsp"><button>회원정보</button></a>
<a href="logout.jsp"><button>로그아웃</button></a>
</body>
</html>