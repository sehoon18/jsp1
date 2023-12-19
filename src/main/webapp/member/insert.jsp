<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insert.jsp</title>
</head>
<body>
<h2>회원가입</h2>
<form action="insertPro.jsp" method="post">
아이디 : <input type="text" name="id" required="required"><br>
비밀번호 : <input type="password" name="pass" required="required"><br>
이름 : <input type="text" name="name" required="required"><br>
<input type="submit" value="가입하기">
</form>
<a href="login.jsp"><button>뒤로가기</button></a>
</body>
</html>