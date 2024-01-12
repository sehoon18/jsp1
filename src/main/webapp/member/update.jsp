<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/upadte.jsp</title>
</head>
<body>
<%
MemberDTO mDTO = (MemberDTO)request.getAttribute("memberDTO");

if (mDTO != null){
	%>
	<form action="updatePro.me" method="post">
	아이디 : <input type="text" name="id" value="<%=mDTO.getId() %>" readonly><br>
	비밀번호 : <input type="password" name="pass"><br>
	이름 : <input type="text" name="name" value="<%=mDTO.getName() %>"><br>
	<input type="submit" value="수정하기">
	<input type="button" value="취소" onclick="history.back();">
	</form>
	<%
} else{
	%>
	아이디 없음
	<%
}
%>

</body>
</html>