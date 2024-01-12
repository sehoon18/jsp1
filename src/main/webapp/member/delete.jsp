<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/delete.jsp</title>
</head>
<body>
<%
MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
%>
<form action="deletePro.me" method="post">
아이디 : <input type="text" name="id" value="<%=memberDTO.getId() %>" readonly>
비밀번호 : <input type="password" name="pass">
<input type="submit" value="확인">
<input type="button" value="취소" onclick="history.back();">

</form>
</body>
</html>