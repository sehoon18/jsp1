<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/loginPro.jsp</title>
</head>
<body>
<h1>jsp1/loginPro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String sid = request.getParameter("id");
String spw = request.getParameter("pw");
%>
폼에서 입력한 아이디 : <%=sid %><br>
폼에서 입력한 비밀번호 : <%=spw %><br>
<%
// db에 저장된 사용자 dbId = "admin", dbPass = "p123" 임의로 정하기
String dbId = "admin";
String dbPass = "p123";
%>
DB아이디 : <%=dbId %><br>
DB비밀번호 : <%=dbPass %><br>
<%
// 폼아이디 db아이디 비교 and 폼비밀번호 db비밀번호 비교
if(sid.equals(dbId) && spw.equals(dbPass)){
	out.println("아이디/비밀번호가 일치합니다");
	session.setAttribute("id", sid);
	// jsp1/loginMain.jsp 로 이동
	response.sendRedirect("loginMain.jsp");
} else {
	out.println("아이디/비밀번호가 일치하지 않습니다");
	// jsp1/login.jsp 로 이동
	response.sendRedirect("login.jsp");
}
%><br>
</body>
</html>